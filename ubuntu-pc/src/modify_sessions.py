#!/usr/bin/
import os
import re
import fileinput 
from pathlib import Path
import numpy as np
import pandas as pd
from typing import Union



def parse_desktop(desktop_file: str) -> dict:
    valid_line = (lambda a_line: 
        ('=' in a_line) and ('[' not in a_line.split('=')[0]))

    def set_line(a_line: str) -> tuple: 
        if not valid_line(a_line): return {}

        the_split = a_line.split('=')
        key, pre_value = a_line.split('=', 1)
        value = pre_value.split(';') if key.endswith('s') else pre_value
        return (key, value)
        
    with open(desktop_file, 'r') as _f: 
        lines = _f.read().splitlines()

    desktop_dict = dict(set_line(a_line) 
        for a_line in lines if valid_line(a_line))
    desktop_dict['File'] = desktop_file
    return desktop_dict

    
def sessions_dataframe(sessions_dir: Union[Path, str], order_alias: list) -> pd.DataFrame:
    weak_eq   = ['Exec', 'TryExec']
    strict_eq = weak_eq + ['X-Ubuntu-Gettext-Domain']
    
    # Gets: Name, Comment, Exec, TryExc, Type, DesktopNames, File, 
    #   X-GDM-..., X-Ubuntu-..., X-KDE-...
    parsed_desktops = [parse_desktop(str(a_file)) 
        for a_file in Path(sessions_dir).iterdir() if a_file.suffix == '.desktop']
    
    # Given a 'Name' in PARSED_DESKTOPS, we want the last entry from ORDER_ALIAS
    # that is contained in the lower form of the name. 
    rev_nums = list(reversed(list(enumerate(order_alias))))
    get_order_alias = (lambda a_name: 
        next((ii for ii, to_ord in rev_nums if to_ord in a_name.lower()), -1))

    # The rest are clearer.  
    file2stem = lambda a_file: Path(a_file).stem
    new_stem  =(lambda a_row: 
        a_row['stem'].replace(r"(([1-9]\-)?)", f"{a_row['idx']}-"))
    new_file  =(lambda a_row:
        a_row['File'].replace(a_row['stem'], a_row['n_stem']))
    mod_name  =(lambda name_col: name_col
        .str.replace("GNOME", "Gnome")
        .str.replace("on Xorg", "(Xorg)")
        .str.replace(r" (on |\()Wayland\)?", "", regex=True)
        .str.replace(' II$', '', regex=True))

    the_dataframe = (pd.DataFrame(parsed_desktops)
        .assign(idx_alias = lambda df: df['Name'].map(get_order_alias))
        .assign(n_words = lambda df: df['Name'].str.split(' ').apply(len))
        .sort_values(['idx_alias', 'n_words'])
        .assign(is_dup = lambda df: df.loc[:, strict_eq].duplicated())
        .assign(idx    = lambda df: (~df['is_dup']).cumsum())
        .assign(stem   = lambda df: df['File'].apply(file2stem))
        .assign(n_stem = lambda df: df.apply(new_stem, axis=1))
        .assign(n_file = lambda df: df.apply(new_file, axis=1))
        .assign(name2  = lambda df: mod_name(df['Name']))
        .assign(name_dup = lambda df: df['name2'].duplicated())
        .assign(n_name = lambda df: df['name2']
                .where(~df['name_dup'], df['name2']+' II')))

    return the_dataframe



def clean_sessions(sessions_dir: Union[Path, str], order_alias: list): 
    sessions_dir = Path(sessions_dir)
    sessions_df  = sessions_dataframe(sessions_dir, order_alias)
    
    for _, session in sessions_df.iterrows(): 
        if session['is_dup']: 
            os.remove(session['File'])

        else: 
            os.rename(session['File'], session['n_file'])
            for a_line in fileinput.input(session['n_file'], inplace=True): 
                print(re.sub(r"^Name=.*", f"Name={session['n_name']}", a_line), end='')



if __name__ == '__main__': 

    locations = {
        'xsessions' : "/usr/share/xsessions", 
        'wayland'   : "/usr/share/wayland-sessions"
    }

    ordered = ['gnome', 'plasma', 'kodi', 'ubuntu', 'gnome classic']

    for each, location in locations.items(): 
        clean_sessions(location, ordered)
    
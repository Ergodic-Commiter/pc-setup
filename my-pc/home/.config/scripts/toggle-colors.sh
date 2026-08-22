#!/bin/bash

LIGHT_THEME="org.kde.breeze.desktop"
DARK_THEME="org.kde.breezedark.desktop"

# $(kreadconfig5 --file kdeglobals ...)
current_theme=$(kreadconfig5 --group "KDE" --key "LookAndFeelPackage")

if [[ $current_theme == $LIGHT_THEME ]]; then
    lookandfeeltool -a $DARK_THEME
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    # plasma-apply-colorscheme BreezeDark
    echo "Switched to Dark Mode"
else 
    lookandfeeltool -a $LIGHT_THEME
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light' 
    # plasma-apply-colorscheme BreezeLight
    echo "Switched to Light Mode"
fi

# Optional: killall plasmashell && kstart5 plasmashell


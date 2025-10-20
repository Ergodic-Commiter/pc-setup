from itertools import chain
from pathlib import Path
import re
import sys

LABEL = "DX-P10k #"

def set_p10k(file_path, config=None):
    config = config or Path.home()/'.p10k.zsh'
    cfg_lines = Path(config).read_text(encoding='utf-8').splitlines()
    p10_opts = get_p10k_opts(file_path)
    new_lines = chain.from_iterable(map(treat_line(p10_opts), cfg_lines))
    with_breaks = list(map(lambda ll: ll+'\n', new_lines))
    Path(config).write_text(''.join(with_breaks), encoding='utf-8')


def get_p10k_opts(file_path): 
    lines = Path(file_path).read_text(encoding='utf-8').splitlines()
    return dict(ll.split("=") for ll in lines if not re.match(r'^ *#', ll))

def treat_line(opts, label=None): 
    label = label or LABEL
    def treater(a_line):
        is_escaped = re.search(r"^ *#", a_line) 
        has_opt = next(filter(lambda opt: opt in a_line, opts.keys()), None)
        reg = rf"( *)typeset \-g {has_opt}=.*"
        if is_escaped or not has_opt:
            return (a_line,)
        assert re.search(reg, a_line),\
            f"Line {a_line} with value '{has_opt}' must conform to regex: {reg}"
        val_opt = opts[has_opt]
        comment = re.sub(r"^( *)typeset", rf"\1# {label} typeset", a_line)
        new_val = re.sub(rf"{has_opt}=.*", f"{has_opt}={val_opt}", a_line)
        return (comment, new_val)
    return treater


if __name__ == '__main__':
    p10k_opts = Path.cwd()/'refs/p10k.txt'
    p10k_cfg = Path.home()/'.p10k.zsh'
    new_opts = sys.argv[1] if len(sys.argv) > 1 else p10k_opts
    set_p10k(new_opts, p10k_cfg)

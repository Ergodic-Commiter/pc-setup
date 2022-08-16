
export CONDA_PKGS_DIRS="/home/common/conda/pkgs","/home/common/conda/anaconda3/pkgs","/home/diego/.conda/pkgs"
export CONDA_ENVS_DIRS="/home/common/diego/envs"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/common/conda/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/common/conda/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/common/conda/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/common/conda/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function theme-preview
    set -l dir ~/Deveveloper/z-outsiders/iterm-colors/iterm-dynamic-colors
    ls $dir | fzf --bind "focus:execute-silent(sh $dir/{} > /dev/tty)"
end
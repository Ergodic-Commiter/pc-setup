# ~/.config/fish/config.fish

# Run only in interactive shells
if not status is-interactive
    exit
end

#1 Path y Locale
fish_add_path $HOME/.local/bin

set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US:en


#2 PYENV
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

pyenv init - | source
pyenv virtualenv-init - | source


#3 Editor
if set -q SSH_CONNECTION
    set -gx EDITOR vim
else
    set -gx EDITOR mvim
end


#4 Aliases
if test -f $HOME/.aliases.fish
    source $HOME/.aliases.fish
end

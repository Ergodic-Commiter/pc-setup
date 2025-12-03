# En orden: 
# 0) Powerlevel10k prompt. 
# 1) Minimal PATH y Locale
# 2) Pyenv (antes que oh-my-zsh, conda)
# 3) OhMyZSH
# 4) UserConfig, Editor
# 5) Conda (después de Pyenv)
# 6) Package indexes/ PIP tweaks
# 7) Homebrew (después de Pyenv)


# 0) Enable Powerlevel10k instant prompt. Casi hasta arriba.  
# Sólo después de prompts del usuario [Y/n]
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# 1) Path y Locale
# If you come from bash you might have to change your $PATH.
# DIEGO: Modificamos el Path para el VirtualEnv. 
# ... $HOME/bin no tiene nada
export PATH=$HOME/.local/bin:$PATH 
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

typeset -U path fpath3


# 2) PYENV 
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


## 3) OhMyZsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=30
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="%d-%m-%Y"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(git)
# DX: Al utilizar una configuración para dos usuarios, ZSH detecta peligro
# entre uno y otro, la solución es cambiar ZSH_DISABLE_COMPFIX
# ZSH_DISABLE_COMPFIX="true"
fpath+=$HOME/.zfunc
source $ZSH/oh-my-zsh.sh


## 4) User Config and Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
# export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch x86_64"


# 5) Aliases
# Personal aliases may override those by oh-my-zsh. 
# Se recomienda poner en ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f "$HOME/.aliases" ]; then 
  source $HOME/.aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## 6) Anaconda. 
# >>> conda initialize >>>
# $HOME/Code/Programs/anaconda3
AT_CONDA="/opt/anaconda3"
__conda_setup="$("${AT_CONDA}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "${AT_CONDA}/etc/profile.d/conda.sh" ]; then
    . "${AT_CONDA}/etc/profile.d/conda.sh"
  else
    export PATH="${AT_CONDA}/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<


# 7) Más de Pip y Homebrew
export PIP_TRUSTED_HOST="files.pythonhosted.org pypi.org pypi.python.org"
export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"


fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

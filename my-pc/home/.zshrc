# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en


# Modificaciones individuales, y que dependen del OS:  
if [[ $OSTYPE == "linux"* ]]; then 
  export AT_CONDA=$HOME/Code/Programs/anaconda3
elif [[ $OSTYPE == "darwin"* ]]; then 
  export PATH=/opt/homebrew/bin:$PATH
fi   
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# DIEGO: aliases en archivo de aliases, pero luego ni hay nada interesante. 
if [ -f "$HOME/.aliases" ]; then 
  source $HOME/.aliases
fi


# PYENV 
export PYENV_ROOT="$HOME/.pyenv"
export PIP_TRUSTED_HOST="files.pythonhosted.org pypi.org pypi.python.org"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


############### OH-MY-ZSH configurations ################## 

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# DIEGO: Al utilizar una configuración para dos usuarios, ZSH detecta peligro
# entre uno y otro, la solución es cambiar ZSH_DISABLE_COMPFIX
# ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=robbyrussell, agnoster, mh, powerlevel10k/powerlevel10, random
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment to change timestamp shown in the history command output.
# Set predefined formats:  "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or 'man strftime' for custom formats.
HIST_STAMPS="%d-%m-%Y"

# Oh-my-zsh Plugins from ~/.oh-my-zsh/(custom/)plugins/*
# Example: plugins=(rails git textmate ruby lighthouse)
plugins=(git pyenv)

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment for case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment to disable marking untracked files under VCS as dirty. 
# Makes large repository status check much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# For customized aliases, it is recommended to define 
# them within ZSH_CUSTOM.  For a list of alias, run `alias`.


################################################################################
source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Referencia .../Repos/powerlevel10k/powerlevel10k.zsh-theme


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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


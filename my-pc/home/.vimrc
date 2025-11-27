set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set langmap=-/,_?
set scrolloff=4

" ### Recomendaciones del libro CPython"
syntax on
set nocompatible    " be iMproved, required

filetype off        " required
set rtp+=~/.vim/bundle/Vundle.vim   " Runtime path to include Vundle and initialize
call vundle#begin()
" Plugin commands between vundle#begin/end
" plugin from http://vim-scripts.org/vim/scripts.html

Plugin 'VundleVim/Vundle.vim' 
Plugin 'tpope/vim-fugitive'  " plugin on GitHub repo
Plugin 'majutsushi/tagbar'

    " Plugin 'L9'
    " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'

    " git repos on your local machine (i.e. when working on your own plugin)
    Plugin 'file:///home/gmarik/path/to/plugin'

    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Install L9 and avoid a Naming conflict if you've already installed a
    " different version somewhere else.
    " Plugin 'ascenator/L9', {'name': 'newL9'}

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

autocmd FileType c call tagbar#autoopen(O)      "Tagbar for C
autocmd FileType python call tagbar#autoopen(O) "Tagbar for Python
set laststatus=2                        " StatusBar: optional
set statusline=%{FugitiveStatusline()}  " Status: git (branch)

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lines

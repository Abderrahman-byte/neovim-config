" OPTIONS
set number
set cursorline
set showmode
set wildmenu
set mouse=
set title
" set cursorcolumn

" SYNTAX
filetype plugin indent on
syntax on

" TABS
se tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" LUA
lua require('plugins')

augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" THEMES
colorscheme tokyonight-moon

set tabstop=2
set shiftwidth=2
set expandtab
"set number
set hlsearch
set ruler
set mouse=v
highlight Comment ctermfg=green
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
"colorscheme srcery
"colorscheme easyeyes
"setlocal spell spelllang=en_us
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
set nocompatible
filetype plugin on
"let g:tokyodark_transparent_background = 0
"let g:tokyodark_enable_italic_comment = 1
"let g:tokyodark_enable_italic = 1
"let g:tokyodark_color_gamma = "1.0"
nnoremap ; :
vnoremap ; :


call plug#begin()
Plug 'https://github.com/folke/tokyonight.nvim'
call plug#end()

colorscheme tokyonight-night
"colorscheme red-dark
"colorscheme delek
"set bg

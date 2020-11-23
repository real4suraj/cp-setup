" Mapping Leader Key as Space
	let mapleader =" "

" C++ Configuration For Linux
	autocmd BufNewFile *.cpp -r ~/.config/nvim/template.cpp
	autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
	nnoremap gb :wa <CR>:!g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && ./%:r < %:r.in > %:r.out 2> %:r.err<CR>
	nnoremap <F2> :50vsp ./%:r.in <bar> :sp ./%:r.out <bar> :wa <bar> :wincmd h <bar> 54 <CR>

" Initial Plug Setup For Linux
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
	call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'tpope/vim-surround'
		Plug 'dart-lang/dart-vim-plugin'
		Plug 'preservim/nerdtree'
		Plug 'tpope/vim-commentary'
		Plug 'ap/vim-css-color'
		Plug 'sheerun/vim-polyglot'
		Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
		Plug 'Raimondi/delimitMate'
		Plug 'vim-airline/vim-airline'
		Plug 'ryanoasis/vim-devicons'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'rafi/awesome-vim-colorschemes'
	call plug#end()


" dart preference
	let g:dart_style_guide = 2
	let g:dart_format_on_save = 1

" vim go (polyglot) settings.
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_types = 1
	let g:go_highlight_function_parameters = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_format_strings = 1
	let g:go_highlight_variable_declarations = 1
	let g:go_auto_sameids = 1

" air-line
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'purify'
	let g:airline#extensions#tabline#enabled = 1

	if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
	endif

" unicode symbols
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.linenr = '␊'
	let g:airline_symbols.linenr = '␤'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''

" colorscheme config
	colorscheme jellybeans
	highlight Comment cterm=italic gui=italic
	let g:jellybeans_use_term_italics = 1

	set t_Co=256

" Some basics:
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard+=unnamedplus
	set nowrap
	nnoremap c "_c
	set termguicolors
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" GoTo code navigation.
	nmap <leader>gd <Plug>(coc-definition)
	nmap <leader>gy <Plug>(coc-type-definition)
	nmap <leader>gi <Plug>(coc-implementation)
	nmap <leader>gr <Plug>(coc-references)
	nmap <leader>rr <Plug>(coc-rename)
	nmap <leader>g[ <Plug>(coc-diagnostic-prev)
	nmap <leader>g] <Plug>(coc-diagnostic-next)
	nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
	nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
	nnoremap <leader>cr :CocRestart

" Copy whole code
	nmap <leader>y ggVG"+y''

" Shortcutting split navigation, saving a keypress:
	nnoremap <leader>h :wincmd h<CR>
	nnoremap <leader>j :wincmd j<CR>
	nnoremap <leader>k :wincmd k<CR>
	nnoremap <leader>l :wincmd l<CR>

" split navigations
	nnoremap <C-J> :sp<space>
	nnoremap <C-L> :vsp<space>

" Replace ex mode with gq
	map Q gq

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
	if &diff
	    highlight! link DiffText MatchParen
	endif

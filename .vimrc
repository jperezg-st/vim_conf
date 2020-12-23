set nocompatible              " required
filetype off                  " required
" set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
	" Bundle 'Valloric/YouCompleteMe'
	Plugin 'easymotion/vim-easymotion'
	Plugin 'haya14busa/incsearch.vim'
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	" Git Integration #
	Plugin 'tpope/vim-fugitive'
	" Line numbering
	Plugin 'jeffkreeftmeijer/vim-numbertoggle'
	" CtrlP 
	Plugin 'kien/ctrlp.vim'
	" File Browsing
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'arcticicestudio/nord-vim'
	" Color schemes
	Plugin 'jnurmine/Zenburn'
	Plugin 'altercation/vim-colors-solarized'
	" SimpylFold
	Plugin 'tmhedberg/SimpylFold'
	" Syntax Checking/Highlighting
	Plugin 'vim-syntastic/syntastic'
	Plugin 'nvie/vim-flake8'
	" Emmet.vim
	Plugin 'mattn/emmet-vim'
" ...

" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required

" Basic configuration
	"Where to split
		set splitbelow
		set splitright
	"split navigations
		nnoremap <C-J> <C-W><C-J>
		nnoremap <C-K> <C-W><C-K>
		nnoremap <C-L> <C-W><C-L>
		nnoremap <C-H> <C-W><C-H>
	" Enable folding
		set foldmethod=indent
		set foldlevel=99
	" Enable folding with the spacebar
		nnoremap <space> za
	" Flagging Unnecessary Whitespace
		au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/
	" UTF-8 Support
		set encoding=utf-8
	" System Clipboard for when want to copy from outside of vim
		set clipboard=unnamed
	" Make it cool
		let python_highlight_all=1
		syntax on
	" Netrw File Explorer
		let g:netrw_banner = 0
		let g:netrw_liststyle = 3
	" let g:netrw_browse_split = 2
	" let g:netrw_altv = 1
		let g:netrw_winsize = 50
	" Logic to define which scheme to use based upon the VIM mode
		colorscheme nord
		call togglebg#map("<F5>")
	"
		set hidden
		set number relativenumber
		set laststatus=2

		let g:SimpylFold_docstring_preview=1

		let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
	" Auto-Complete
	" let g:ycm_autoclose_preview_window_after_completion=1
	" map <leader>g :YcmComplete GoToDefinitionElseDeclaration<CR>
	
		augroup remember_folds
			autocmd!
			autocmd BufWinLeave * mkview
			autocmd BufWinEnter * silent! loadview
		augroup END

" Incsearch
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)
	set hlsearch
	let g:incsearch#auto_nohlsearch = 1
	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)

" Easymotion
	let mapleader=","
	let g:EasyMotion_do_mapping = 0 " Disable default mappings

	" <Leader>f{char} to move to {char}
	" map  <Leader>f <Plug>(easymotion-bd-f)
	" nmap <Leader>f <Plug>(easymotion-overwin-f)

	" s{char}{char} to move to {char}{char}
		nmap s <Plug>(easymotion-overwin-f2)

	" Move to line
		map <Leader>L <Plug>(easymotion-bd-jk)
		nmap <Leader>L <Plug>(easymotion-overwin-line)

	" Move to word
		map  <Leader>w <Plug>(easymotion-bd-w)
		nmap <Leader>w <Plug>(easymotion-overwin-w)

	" Jump to anywhere you want with minimal keystrokes, with just one key binding.
	" `s{char}{label}`
		nmap F <Plug>(easymotion-overwin-f)
	" or
	" `s{char}{char}{label}`
	" Need one more keystroke, but on average, it may be more comfortable.
		nmap f <Plug>(easymotion-overwin-f2)

	" Turn on case-insensitive feature
		let g:EasyMotion_smartcase = 1

	" JK motions: Line motions
		map <Leader>j <Plug>(easymotion-j)
		map <Leader>k <Plug>(easymotion-k)

	" kite configuration
		let g:kite_supported_languages = ['python']
		set statusline=%<%f\ %h%m%r{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
		set laststatus=2

" Emment mode
	let g:user_emmet_mode='a'
	let g:user_emmet_install_global = 0
	autocmd FileType html,css EmmetInstall
	let g:user_emmet_leader_key = '<C-Z>'


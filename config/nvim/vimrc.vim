" VIM CONFIG

" ---[ OPTIONS ]---

" THEME
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" AFFICHAGE
set title " Met à jour le titre de la fenêtre
set number
set inccommand=nosplit
" set rnu " Relative line number

" BEEP
set visualbell " Empeche Vim de beeper
set noerrorbells " Empeche Vim de beeper

" RECHERCHE
set ignorecase " Ignore la casse lors des recherches
set incsearch " Recherche incrémentale
set hlsearch " Surligne les résultats de recherche

set wrap " Retour à la ligne automatique
set linebreak " Retour à la ligne automatique
set scrolloff=5 " Laisse 5 lignes en haut et en bas

" VIM-CAST

" SEE THE INVISIBLE
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" ESC in Terminal mode
tnoremap <Esc> <C-\><C-n>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list

" WHTES-SPACES and TABS

set tabstop=3
set softtabstop=3
set shiftwidth=3

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype on
	filetype plugin on

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
endif


" General options

"set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
"set autoindent " Indent a new line
"set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
"set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax enable
"set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim

" ---[ PLUG-IN ]---

" Copilot
" Copilot disable " Disable Copilot
" let g:copilot_filetypes = { '*': v:false, 'python': v:true, 'bash': v:true, 'c': v:true, 'rust': v:true}
" imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" LuaSnip
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" call plug#begin()

" Tabby plugin
" Plug 'TabbyML/vim-tabby'
" let g:tabby_keybinding_accept = '<C-f>'
" let g:tabby_keybinding_trigger_or_dismiss = '<C-\>'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-t>"
" let g:UltiSnipsJumpBackwardTrigger="<c-e>"
" let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" Plug 'tpope/vim-vinegar'
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " vinegar will initialize with dot files hidden
" Press gh to toggle dot file hiding.

" NERD-TREE
" Plug 'preservim/nerdtree'

" fzf
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" BROKEN :/
" Oil.nvim
" Plug 'stevearc/oil.nvim', { 'do': { -> oil#setup() } }
"nnoremap - :Oil<CR>
"lua require('init')
""
" call plug#end()

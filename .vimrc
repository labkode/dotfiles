set t_Co=16
call plug#begin()
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'styled-components/vim-styled-components'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Go
Plug 'farmergreg/vim-lastplace'
Plug 'tomasiser/vim-code-dark'
call plug#end()              " required

colorscheme codedark

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" This makes the signature function always pop up
" see https://github.com/neoclide/coc.nvim/issues/537#issuecomment-473649657
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-go', 'coc-pyright', 'coc-rust-analyzer']

"filetype plugin indent on    " required
"set smartindent
set ttyfast
set lazyredraw
set updatetime=300
set hidden " Open other files if current one is not saved

set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"set smartindent
set mouse=a
set number
set numberwidth=4
set ruler
"set autoindent
"set cindent
set foldmethod=syntax
set foldlevel=99
nmap z za
set noerrorbells visualbell t_vb=
set nobackup
set nowritebackup
set noswapfile
set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search
autocmd BufWritePre * :%s/\s\+$//e " Delete empty space from the end of lines on every save
set encoding=utf-8
set termencoding=utf-8
set signcolumn=yes
set laststatus=2
set clipboard=unnamed
set backspace=indent,eol,start " Delete characters outside of insert area

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell
au BufRead,BufNewFile *.txt setlocal spell

let mapleader = " "
inoremap jh <Esc>:w<CR>
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <leader>ov :Vex<CR>
nnoremap <leader>oh :Hex<CR>
nnoremap <Leader><CR> :so ~/.vimrc<CR>
nnoremap <silent><leader>l :Buffers<CR>
nnoremap <silent><leader>d :bdel<CR>
nnoremap <silent><leader>s :A<CR>
nnoremap <silent><leader>v :AV<CR>
nnoremap <silent><leader>ev :vs<CR>
nnoremap <silent><leader>eh :split<CR>
nnoremap <leader>rel :set relativenumber!<cr>
set rtp+=~/.fzf
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg <Cr>
inoremap <silent><expr> <c-space> coc#refresh()
""""

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
""""

syntax on

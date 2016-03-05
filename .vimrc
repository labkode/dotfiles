execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = ','

set backspace=indent,eol,start " http://vim.wikia.com/wiki/Backspace_and_delete_problems

" TAGBAR
let g:tagbar_width=26 " Default is 40, seems too wide
noremap <silent> <Leader>y :TagbarToggle<CR>  " Display panel with y (or ,y)

" NERDTree
map <silent> <Leader>e :NERDTreeToggle<CR> " https://github.com/scrooloose/nerdtree

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tell it to use an undo file
set undofile
" set a directory to store the undo history. CREATE IT MANUALLY
set undodir=~/.vimundo/

" Run commands such as go run for the current file with <leader>r
" or go build and go test for the current package with <leader>b 
" and <leader>t respectively. Display beautifully annotated source
" code to see which functions are covered with <leader>c.

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled, which opens the target 
" identifier in current buffer. You can also open the 
" definition/declaration, in a new vertical, horizontal, 
" or tab, for the word under your cursor:

" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Or open the Godoc in browser
au FileType go nmap <Leader>d <Plug>(go-doc-browser)

" Show type info for the word under your cursor with <leader>i 
" (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

let g:go_auto_type_info=1

" Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

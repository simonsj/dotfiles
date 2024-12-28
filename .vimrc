" Jon Simons' vimrc file

set number
set tabstop=2
set nowrap
set vb

" Show lists of files when doing ":sp" or ":e" or whatever
set wildmode=longest,list
" Set lbr so that linebreaks try to happen at word boundaries
set lbr

set tags=tags;/

" Control j to go down one window, maximize
map <C-j> <C-w>j<C-w>_
" Control k to go up one window, maximize
map <C-k> <C-w>k<C-w>_
" Let windows get as small as possible
set wmh=0

" Toggle highlighting with control h
map <C-h> :set hls!<CR>:echo "highlighting" &hls ? "on" : "off"<CR>
" Toggle list mode with control l
map <C-l> :set list!<CR>:echo "list mode" &list ? "on" : "off"<CR>

if &diff
  " Control h to go to left window
  map <C-h> <C-w>h<CR>
  " Control l to go to right window
  map <C-l> <C-w>l<CR>
  " Control n to go to next diff
  map <C-n> ]c
  " Control p to go to previous diff
  map <C-p> [c
  " I don't use ^F ever; this grabs opposite side's diff piece
  map <C-f> :diffget<CR>
  " I don't use ^D ever; put from current side to the opposite side
  map <C-d> :diffput<CR>
else
  " Control d to close the current buffer
  map <C-d> :bd<CR>
  " Control n to go to next buffer
  map <C-n> :bn<CR>
  " Control p to go to previous buffer
  map <C-p> :bp<CR>
endif

" Shift + left mouse click to split-jump to tag under cursor
map <S-LeftMouse> <LeftMouse>:exe ":sta " expand("<cword>")<CR>

" For my laptop; I know how to type :help.
map <F1> <Esc>
imap <F1> <Esc>

" I have never wanted 'K' to do what it does
map K <Nop>

" Use Q for q
nnoremap Q q
map q <Nop>

set expandtab

autocmd FileType c set tabstop=4 noexpandtab
autocmd BufRead *.h set tabstop=4 noexpandtab

autocmd BufRead *.coffee set expandtab

autocmd FileType sh set expandtab
autocmd FileType sh let g:is_posix = 1
autocmd BufRead *.sh set expandtab

autocmd BufRead *.god set filetype=ruby
autocmd BufRead Brewfile set filetype=ruby

autocmd BufRead *.rb set tabstop=2 expandtab

autocmd BufRead *.pp set filetype=puppet
autocmd BufRead *.aug set tabstop=4

autocmd BufRead *.coffee set filetype=coffee

autocmd BufRead *.make set filetype=make

autocmd FileType make set tabstop=8 noexpandtab

autocmd BufRead *.sc set filetype=python
autocmd BufRead *.py set tabstop=4

autocmd BufRead *.go set filetype=go
autocmd Syntax go source ~/.vim/syntax/go.vim
autocmd FileType go set tabstop=4 noexpandtab

autocmd BufRead *.strace.out set filetype=strace
autocmd BufRead strace* set filetype=strace

au BufRead,BufNewFile *.ts set filetype=typescript

autocmd BufRead,BufNewFile *.m set filetype=octave
autocmd Syntax octave source ~/.vim/syntax/octave.vim

autocmd BufRead,BufNewFile *.sexp set filetype=scheme
autocmd BufRead,BufNewFile jbuild set filetype=scheme

"
" OCaml: try to get merlin stuff working
" https://ocaml.github.io/merlin/editor/vim/
"
autocmd BufRead,BufNewFile *.ml,*.mli set filetype=ocaml
autocmd FileType ocaml filetype plugin on
autocmd FileType ocaml filetype indent on
autocmd FileType ocaml let g:opamshare = substitute(system('opam var share'),'\n$','','''')
autocmd FileType ocaml execute "set rtp+=" . g:opamshare . "/merlin/vim"
autocmd FileType ocaml map <C-l> :set list!<CR>:MerlinClearEnclosing<CR>:echo "list mode" &list ? "on" : "off"<CR>

autocmd BufRead,BufNewFile *.rs set filetype=rust

set t_Co=256
syn on
color estilo-xoria256

if has('nvim')
  set noincsearch
  set listchars=eol:$
endif

" ~/.vimrc

set all&                   " restore defaults; ignore global vimrc

set background=dark        " use light-on-dark color scheme

set shortmess+=I           " do not show startup message
set laststatus=2           " always show status line
set clipboard=unnamed      " use system clipboard on Mac

set nowrap                 " do not wrap long lines
set sidescroll=1           " scroll horizontally in 1 column increments

set splitbelow             " put new hsplit windows on the bottom
set splitright             " put new vsplit windows on the right

set shiftwidth=4           " indent/unindent by 4 spaces
set softtabstop=4          " tab/backspace use 4 spaces
set expandtab              " expand tabs to spaces
set autoindent             " keep new-line indentation at same level

set incsearch              " search as you type
set hlsearch               " highlight search matches
set ignorecase             " case-insensitive search
set smartcase              " case-heuristic search

set showmatch              " highlight matching brackets
set whichwrap=s,b,<,>,[,]  " space, backspace and arrows can cross newlines
set pastetoggle=<Insert>   " insert toggles paste mode

set ttimeoutlen=100        " key-codes timeout after 100ms
set timeoutlen=2000        " key-mappings timeout after 2000ms

set wildmenu
set wildmode=longest:full,full

set backspace=indent,eol,start
set listchars=tab:>-,trail:-,precedes:<,extends:>

set statusline=
set statusline+=\ %F                " full file path
set statusline+=%=                  " switch to right-align
set statusline+=[%Y%R%M]            " filetype,readonly,modified
set statusline+=[%{&fileencoding?&fileencoding:&encoding}]  " file-encoding
set statusline+=[0x%02B]            " char value
set statusline+=[%03l:%02c]         " line:col
set statusline+=[B%05o/%02p%%/%LL]  " byte-number/percentage/file-length

syntax on                  " use syntax highlighting
filetype plugin indent on  " detect file types

let g:netrw_banner=0       " disable header
let g:netrw_keepdir=0      " cwd tracks file explorer
let g:netrw_liststyle=3    " tree-style file explorer

" Make Ctrl-t-* tab actions match Ctrl-w-* window actions
" Ctrl-t-n opens new tab
" Ctrl-t-w opens new tab of current window
" Ctrl-t-c closes current tab
" Ctrl-t-o closes other tabs
" Ctrl-t-(Left|Right) navigates tabs
" Ctrl-Page(Up|Down) navigates tabs by default
nmap <C-t>  <NOP>
nmap <C-t>n :tabnew<CR>
nmap <C-t>w <C-w>T
nmap <C-t>c :tabclose<CR>
nmap <C-t>o :tabonly<CR>
nmap <C-t><Left>  :tabprevious<CR>
nmap <C-t><Right> :tabnext<CR>

" Ctrl-e opens file explorer
nmap <C-e> :Explore<CR>

" Ctrl-(Up|Down) scrolls the buffer in the window
nnoremap <C-Up>   <C-Y>
nnoremap <C-Down> <C-E>

" Space toggles the current fold open/closed
nmap <Space> zA

" Enter goes to the tag under cursor
" Backspace goes to the previous tag
" Ctrl-f searches for a tag
nmap <CR>  g<C-]>
nmap <BS>  :pop<CR>
nmap <C-f> :tjump<SPACE>

" Ctrl-u lists the undo-branches
nmap <C-u> :undolist<CR>

" Ctrl-h toggles search result highlighting
nmap <C-h> :set hlsearch! hlsearch?<CR>

" Ctrl-p toggles non-printable characters
nmap <C-p> :set list! list?<CR>

" Ctrl-_ toggles cursor line highlighting
nmap <C-_> :set cursorline! cursorline?<CR>

" Map common Ctrl keys for tmux emulating
" TERM=screen-256color + xterm-keys
if &term =~ "screen"
    map [1;5A  <C-Up>
    map [1;5B  <C-Down>
    map [1;5C  <C-Right>
    map [1;5D  <C-Left>
    map        <C-Insert>
    map [3;5~  <C-Delete>
    map [1;5H  <C-Home>
    map [1;5F  <C-End>
    map [5;5~  <C-PageUp>
    map [6;5~  <C-PageDown>
endif

" Tab-Completion
function! SmartTab()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    elseif strlen(&omnifunc) > 0
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=SmartTab()<CR>

" HTML
autocmd FileType html set softtabstop=2 shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Commands ------------------------------------------------------------ {{{

" Remember Vim is a modal editor - normal, command, insert, replace, visual modes

""" Modes
" Vim is in normal mode by default.
" You move from one mode to another, after going back to Normal mode

""" Normal mode
" (Esc) OR (Ctrl+]) to get to Normal mode

""" Command mode
" '/<search term>' to search
" ':e <filename + ext' to edit another file
" ':e (Tab)' to list other files in that dir that you can go edit directly (wildmenu)

" ':%s/foo/bar/g' to replace all 'foo' with 'bar'
"       (%) Means across all lines
"       (s) Means substitute
"       (/foo) is regex to find things to replace
"       (/bar/) is regex to replace things with
"       (/g) means global, otherwise it would only execute once per line

" ':h' OR ':help' to get to help documentation
" Also ':h splits' to get to help documentation about split screen

""" Insert mode
" (i) to get into -- INSERT -- mode

""" Replace mode
" Navigate the cursor to the point of interest
" (Esc) OR (Ctrl+]) to get to Normal mode

""" Visual mode - 3 subtypes: visual, block-visual and linewise-visual
" Navigate the cursor to the point of interest
" (v) to get into -- VISUAL -- mode                                 (select)
" (Shift+v) to get into -- VISUAL LINE -- (OR linewise-visual) mode (select lines)
" (Ctrl+v) to get into -- VISUAL BLOCK -- (OR block-visual) mode    (select any rectangular region)

" Use [h,j,k,l] or arrow-keys to highlight
" [d,u,y,p] to [delete(OR cut),undo,yank(OR copy),put(OR paste)]


""" Navigating - Moving the cursor
" (h) to move one character left
" (j) to move one row down
" (k) to move one row up
" (l) to move one character right
" (4j) to move 4 rows down
" (6k) to move 6 rows up
" ($) to go to the end of the line
" (0) OR (^) to go to the beginning of the line
" (G) to go to the final line of the file
" (GA) to go to the end of the file (end of the final line)
" (gg) to go to the beginning of the file
" (r) + <letter> to replace a single character
" (x) to delete a single character
" (u) to undo
" (Ctrl+r) to redo
" (Shift+J) to delete breakline
" (Shift+K) to get Man page of a command. Press while the cursor is at the word


""" Folds
" 'zo' to open a single fold under the cursor
" 'zc' to close the fold under the cursor
" 'zR' to open all folds
" 'zM' to close all folds


""" Split screen
" 'Ctrl+w v OR 'vsplit' OR 'vsp <filename + ext>' to vertically split the terminal window and open the specified file
" 'split' OR 'sp <filename + ext>' to horizontally split the terminal window and open the specified file

" 'Ctrl+w + [h,j,k,l]' to focus on either [left,bottom,top,right]
" Remapped to 'Ctrl+[h,j,k,l]'

" 'Ctrl+w + [+,-,<,>]' to [increase height, decrease height, decrease width, increase width] of current split
" 'Ctrl+w + [|,_,=]' to [max out width of current split, max out height of current split, resize all split windows]

" 'Ctrl+w + [R]' OR 'Ctrl+w + [r]' to swap top/bottom or left/right split
" Remapped to 'Ctrl+R' AND 'Ctrl+r'
" 'Ctrl+w + [q]' to close current window
" Remapped to 'Ctrl+q'
" 'Ctrl+w + [o]' to close every window in the current tabview but the current one
" Remapped to 'Ctrl+o'

" }}}

""" If you edit this file, reload by running ':source ~/.vimrc
" Reminder:
" 'zR' to open all folds in this file
" '\ss' to remove all trailing whitespace
" (u) to undo
" (Ctrl+r) to redo

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Do not save backup files.
set nobackup

" Set the commands to save in history default number is 20.
set history=1000


""" filetype

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on

""" Editor

" Use dark background
set background=dark
" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4
" Use space characters instead of tabs.
set expandtab
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Show partial command you type in the last line of the screen.
set showcmd
" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable mouse in all modes
set mouse=a
" Allow backspace in insert mode
set backspace=indent,eol,start


""" splitscreen

" When you create a vertically split window, it will open to the right (instead of the default left)
set splitright
" When you create a horizontally split window, it will open to the bottom (instead of the default top)
set splitbelow


""" wildmenu

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


""" search

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch


" PLUGINS ------------------------------------------------------------- {{{

" Automatic installation of vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'wakatime/vim-wakatime'

" If you decide to add the YCM plugin below, uncomment the plugin then run:
"       brew install cmake
"       :source ~/.vimrc
"       vim +PluginInstall +qall
"
"       To compile YCM with semantic support for C-family languages through clangd
"       cd ~/.vim/plugged/YouCompleteMe
"       ./install.py --clangd-completer
Plug 'ycm-core/YouCompleteMe'

""" More plugins go here

call plug#end()

" }}}


" MAPPINGS ------------------------------------------------------------ {{{

" Split screen (see splitscreen in Commands at the top for context)
" Instead of pressing 'Ctrl + w' and then pressing h,j,k,l keys,
" you can simply press 'Ctrl + [h,j,k,l]'
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" I don't use the above mappings as much since I've enabled the mouse,
" I'm keeping them here in case I'm in a system that doesn't have a mouse
nnoremap <C-Q> <C-W><C-Q>
nnoremap <C-o> <C-W><C-o>
" S for switching windows (L-R, T-B)
nnoremap <C-S> <C-W><C-R>

""" More Mappings code goes here.

" }}}


" VIMSCRIPT ----------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Strip trailing whitespace (\ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

""" More Vimscripts code goes here.

" }}}


" STATUS LINE --------------------------------------------------------- {{{

" Clear status line when vimrc is reloaded.
set statusline=

""" Status line left side.

" %F - full path of the current file
" %M - Modified flag shows if file is unsaved
" %Y - Type of file in the buffer
" %R - Displays the read-only flag
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

""" Status line right side.

" %b   - Shows the ASCII/Unicode character under cursor
" 0x%B - Shows the hexadecimal character under cursor
" %l   - Display the row number
" %p%% - Shows the cursor percentage from the top of the file
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ \|\ row:\ %l\ col:\ %c\ \|\ %p%%\ \

" Show the status on the second to last line.
set laststatus=2

""" More Status bar code goes here.

" }}}

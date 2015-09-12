
autocmd! bufwritepost .vimrc source %


" Better copy and paste
set pastetoggle=<F2>
" set clipboard=unnamed

" Mouse and backspace
if has("mouse")
    set mouse+=a " on OSX press ALT and click
endif
set bs=2 " make backspace behave like like normal agian
" To drag splits in tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Rebind <Leader> key
let mapleader = ","



" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick save command
"noremap <C-Z> :update<CR>
"vnoremap <C-Z> <C-C>:update<CR>
"inoremap <C-Z> <C-O>:update<CR>


" Quick quit commands
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all windows

" bind Cntrl+<movemnt> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabp<CR>
map <Leader>m <esc>:tabn<CR>

" map sort function to a key
map <Leader>s :sort<CR>


" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/color && cd ~/.vim/color
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlightingon
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Show line numbers and lenght
set number " show line numbers
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=Black
let &colorcolumn="80,".join(range(120,999),",")

" Easier formating of paragraphs
vmap Q gq
vmap Q gqap


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensiteve
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files they tigger too many events for file system
" watchers
"set nobackup
"set nowritebackup
"set noswapfile


" Set up Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle; \
" curl -Sso ~/.vim/autoload/pathogen.vim \
"    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" New plugins go into ~/.vim/bundle/plugin-name/ folder
call pathogen#infect()


" ================
" Python IDE setup
" ================

" Settings for powerline
" https://github.com/Lokaltog/powerline

" Setting for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_hight = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Install Supertab:
" cd ~/.vim/bundle/; \
" git clone git://github.com/ervandew/supertab.git
let g:SuperTabDefaultCompletionType = "context"


" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction


inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim \
"     http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


set wildmenu
set noeb vb t_vb=

" Ask for password when saving file required sudo access
" cmap w!! %!sudo tee > /dev/null %


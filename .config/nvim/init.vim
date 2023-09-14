" INSTALL INSTRUCTIONS "
" Make sure all providers are correctly set up
"   Open vim window
"   :checkhealth provider
"
""""""""""""""""""""""""""""
" Make sure neovim gem is installed
" $ gem install neovim
"
" Make sure npm neovim is installed
" $ brew install node
" $ npm install -g neovim
"
" Make sure yarn neovim is installed
" $ yarn global add neovim
"
" Make sure python neovim is installed
" $ pip3 install --user neovim
"
" Install python 3
" $ python3 -m pip install --user --upgrade pynvim
"
" NOTE: this may not be needed anymore
" Make sure pynvim is installed
" $ pip2 install pynvim
" $ pip3 install pynvim
" "
""""""""""""""""""""""""""""
" When Solar graph is installed, also install this
" $ pip3 install solargraph-utils.py --user
"
""""""""""""""""""""""""""""
" To install Nodejs and NPM
" $ asdf install nodejs 16.15.1
" $ asdf global nodejs 16.15.1
"
" $ npm i -g asdf
" $ npm install -g npm@8.18.0
"
""""""""""""""""""""""""""""

"set showmode "display current mode
"set showcmd "display current mode
" set cursorline "highlight current line
" set colorcolumn=80 " Highlight Characters that overstep the character limit
" set cursorcolumn
set nu

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" Use comma for leader
let g:mapleader=','

set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in other modern browsers

set ignorecase " Ignore case when searching
set list
set listchars=tab:›\ ,trail:.


  " Print generating ctags message function
  function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0
      let l:msg .= '♨'
    endif
    if index(a:mods, 'cscope') >= 0
      let l:msg .= '♺'
    endif
    return l:msg
  endfunction

  " set statusline based on ctags function from man page
  set statusline+=%{gutentags#statusline_cb(
        \function('<SID>get_gutentags_status'))}

" Statusline format
" set statusline=
"" set statusline+=%#title#\ %{GitBranch()}\  " branch name
" set statusline+=%#normal#\ %f\  " filename
" set statusline+=%#type#\ %Y\ "filetype
" set statusline+=%#structure#%h      "help file flag
" set statusline+=%m      "modified flag
" set statusline+=%r      "read only flag
" set statusline+=%{gutentags#statusline()}
" set statusline+=%#warningmsg#\ %{NeomakeStatusLine()}
" set statusline+=%#normal#%=      "left/right separator
" set statusline+=%P\     "percent through file
" set statusline+=[%l:%c]     "cursor column

" Use ESC to exit terminal mode in Neovim
tnoremap <Esc> <C-\><C-n>

" backspace through everything in insert mode
set backspace=indent,eol,start

" -------------------------Buffers------------------------------
set hidden " stay in background, dont unload when abandoned
set fileformat=unix " set unix line endings
set fileformats=unix,dos " Unix line endings
set modifiable "modify a file with read only
" Close the current buffer and move to the previous one
nnoremap <leader>d :bp\|bd #<CR>
nmap <TAB> :bnext<CR>
nmap <Leader><TAB> :bprevious<CR>
nmap <leader>t :enew<cr>
nmap T :tabnew<cr>

" -------------------------Tabs----------------------------------
nnoremap H gT
nnoremap L gt

" -------------------------Macro---------------------------------
"remove all binding pry
"nnoremap <leader>b :g/binding/d1 <CR> :w <CR>
let @b="obinding.pry0"

"remove all iex pry
nnoremap <leader>i :g/IEx.pry/d1 <CR> :w <CR>
let @p="oIEx.pry()0"

"remove all skip, for testing
nnoremap <leader>x :g/skip/d1 <CR> :w <CR>
let @s='oskip0'

" ------------------------Scrolling------------------------------
set scrolloff=3 " keep the cursor visible within 3 lines when scrolling
set sidescrolloff=15
set sidescroll =1
" Fast scrolling
set ttyfast
" Increase scrolling speed; speed very laggy without command.
set lazyredraw
set redrawtime=5000
" pattern uses more memory than 'maxmempattern'
set mmp=5000

" Set regex engine - for redrawing purposes
" The possible values are:
" 0       automatic selection
" 1       old engine
" 2       NFA engine
set re=2

" Get the title from the iterm tab
set title

" Give more space for displaying messages.
set cmdheight=1

"select all occurences of a word using a mouse
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
":map <2-LeftMouse> *
:imap <2-LeftMouse> <c-o>*

"Full control of mouse
set mouse=a

"This unsets the last search pattern registered -- unselects search
map <Leader><Space> :noh<CR>
" Center search in the middle of the screen
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

"Replace all of one word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set smarttab        " Be smart when using tabs ;)
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces, let backspace delete indents

set backspace=indent,eol,start "Backspace for dummies
set ai "Auto indent
set si "Smart indent

"Wrap lines
set nowrap
set linebreak

set noswapfile " Don't make a backup before overwriting a file.
set nobackup   " And again.
set nowritebackup

"center screen on current line with space
nnoremap <space> zz

"wrapped lines go down/up to next row, rather than next line in file
nnoremap j gj
nnoremap k gk

"stop wrapping lines
set formatoptions-=t

" Window Splits Do the splits
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>

if bufwinnr(1)
  " Add +40 to window size
  " Ctrl-W + . (>)
  map <C-W>. :vertical resize +40<CR>

  " Add -40 to window size
  " Ctrl-W + , (<)
  map <C-W>, :vertical resize -40<CR>

  " Set windows of equal size Ctr-W + Space
  map <C-W><SPACE> <C-W>=
endif

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Move selected block - move row up/down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv

" save with ctrl+s
nmap <c-s> :w<CR> nmap
imap <c-s> <Esc>:w<CR>a

" Better Maps
nnoremap ; :

" Remap VIM 0 to first non-blank character
map 0 ^

" Make cursor move by visual lines instead of file lines (when wrapping)
noremap k gk
noremap j gj

" upper/lower word
nnoremap <leader>u mQviwU`Q
nnoremap <leader>l mQviwu`Q

" Use the clipboard of Mac OS
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
end

" Do a regular paste with no automatic indentation
nnoremap <leader>p p<C-o>
nnoremap <leader>P P<C-o>

" Auto indent pasted text
" <C-o>
nnoremap p p=`]
nnoremap P P=`]

" Replace selection with text in clipboard
vnoremap r "_dP


" copy and paste
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
cno <c-v> <c-r>+

"Yank from current line to end (similar to shift+d or D)
noremap Y y$

set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.DS_Store*,.hg,.svn
set wildignore+=*.a,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class "VCS files
set wildignore+=*~,*.swp,*.tmp,*~,._* " Disable temp and backup files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                  " MacOSX/Linux
set wildignore+=*/node_modules/*,*/bower_components/*     " Node.js
set wildignore+=*/vendor/*,*/dist/*,/target/*,*/.bundle/* " Meh
set wildignore+=*/Godeps/*                                " Go
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz " Disable archive files

" cursor Position was screwy here too
" function! <SID>StripTrailingWhitespaces()
"   " save last search & cursor position
"   let _s=@/
"   let l = line(".")
"   let c = col(".")
"   %s/\s\+$//e
"   let @/=_s
"   call cursor(l, c)
" endfunction

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//e
  call winrestview(l:winview)
endfunction

augroup configgroup
  autocmd!
  " autocmd VimEnter * highlight clear SignColumn
  "quickfix window to very bottom
  autocmd FileType qf wincmd J
  " -- Ruby Config --
  " common Ruby files without .rb
  autocmd BufRead,BufNewFile {Berksfile,*.common,Gemfile,Vagrantfile,Procfile,config.ru,*.god,*.arb} set ft=ruby
  " autocmd BufRead,BufNewFile *.common set syntax=ruby

  " autocmd BufWritePre *.php,*.py,*.js,*.txt,*,hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*,hs,*.java,*.md :call StripTrailingWhite()

  " Not using this one because sometimes it sets cursor elsewhere
  " delete trailing white space
  " au BufWritePre *.coffee :%s/\s\+$//e
  " au BufWritePre *.css    :%s/\s\+$//e
  " au BufWritePre *.haml   :%s/\s\+$//e
  " au BufWritePre *.html   :%s/\s\+$//e
  " au BufWritePre *.js     :%s/\s\+$//e
  " au BufWritePre *.rb     :%s/\s\+$//e
  " au BufWritePre *.ex     :%s/\s\+$//e
  " au BufWritePre *.exs    :%s/\s\+$//e
  " au BufWritePre *.cs     :%s/\s\+$//e
  " au BufWritePre *.scss   :%s/\s\+$//e
augroup END


augroup filetypes
  autocmd!
  " Treat JSON files like JavaScript
  autocmd BufNewFile,BufRead {*.json,*.jsm} set ft=javascript
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
  autocmd BufNewFile,BufRead .prettierrc set filetype=json
  autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc
  autocmd BufNewFile,BufRead .gitignore set filetype=config
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
  autocmd BufNewFile,BufRead zprofile set filetype=zsh
augroup END

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

   " Subscription to github
   Plug 'github/copilot.vim'
  " Manual Installs
  " - https://github.com/github/copilot.vim
  " RUN: :Copilot setup
  " OR
  " RUN: :Copilot

  " mappings for YARD documentation
  Plug 'kkoomen/vim-doge'
    let g:doge_enable_mappings = 1
    let g:doge_doc_standard_ruby = 'YARD'
    let g:doge_mapping  = '<Leader>yg'

  " Install Details
  " https://blog.schembri.me/post/solargraph-in-vim/
  " Install solargraph
  " RUN: $ gem install solargraph
  " Install Plugin
  "
  " A Fast & Minimalism Style Code Completion Plugin for vim/nvim.
  Plug 'jayli/vim-easycomplete'
  " Might want to disable this - Used for snippets
  Plug 'SirVer/ultisnips'
    noremap gr :EasyCompleteReference<CR>
    noremap gd :EasyCompleteGotoDefinition<CR>
    noremap rn :EasyCompleteRename<CR>
    noremap gb :BackToOriginalBuffer<CR>

    let g:easycomplete_scheme="rider"
    let g:easycomplete_nerd_font = 1
    let g:easycomplete_sign_text = {
          \   'error':       "◉",
          \   'warning':     "▲",
          \   'information': '◎',
          \   'hint':        '▧'
          \ }

    " NOTES:
    " Set let g:easycomplete_diagnostics_enable = 0 to disable lsp diagnostics.
    " Set let g:easycomplete_lsp_checking = 0 to disable lsp checking for installation.
    " Set let g:easycomplete_signature_enable = 0 to disable lsp signature checking.

  "
  " NOTE: disabled deoplete for now
  " - code completion tool
  " - replacement: vim-easycomplete
  "
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "   let g:deoplete#enable_at_startup = 1
  "   let g:deoplete#enable_fuzzy_completion = 1
  "
  "
  "   " let g:deoplete#custom#option({
  "   "       \ 'auto_complete_delay': 200,
  "   "       \ 'smart_case': v:true,
  "   "       \ 'ignore_case': v:true,
  "   "       \ })
  "
  "   " use tab for completion
  "   inoremap <expr><tab> pumvisible() ? "\<C-N>" : "\<TAB>"

  Plug 'airblade/vim-gitgutter'
    highlight clear SignColumn
    highlight GitGutterAdd ctermfg=green guifg=darkgreen
    highlight GitGutterChange ctermfg=yellow guifg=darkyellow
    highlight GitGutterDelete ctermfg=red guifg=darkred
    highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-airline'

    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline_inactive_collapse=0

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_theme="tomorrow"
    " unicode symbols
    " let g:airline_theme="papercolor"
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    "let g:airline_section_c = '%t'
    let g:airline_section_c = '%F'
    "let g:airline#extensions#tabline#fnametruncate = 1
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
    let g:airline#extensions#tabline#formatter = 'unique_tail'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_layout = {'down': '~65%'}

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1

    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'


    " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
    " to exclude files: -g '!exclude'
    " Original command!
    " command! -bang -nargs=* Rg
    "       \ call fzf#vim#grep(
    "       \   "rg -g '!node_modules' -g '!frontend' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
    "       \   <bang>0 ? fzf#vim#with_preview('up:60%')
    "       \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    "       \   <bang>0)

    " command try2
    " command! -bang -nargs=* Rg
    "       \ call fzf#vim#grep(
    "       \   "rg -g '!node_modules' -g '!frontend' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
    "       \   fzf#vim#with_preview('right:45%'), <bang>0)

    " ---------------------------------------------------
    "
    " Likewise, Files command with preview window
    " original Files
    " command! -bang -nargs=? -complete=dir Files
    "       \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:45%'), <bang>0)

    " Likewise, Files command with preview window
    " command! -bang -nargs=? -complete=dir Files
    "       \ call fzf#vim#files(
    "       \   "rg -g '!node_modules' -g '!frontend' ".shellescape(<q-args>),
    "       \   fzf#vim#with_preview('right:45%'), <bang>0)

    " ---------------------------------------------------

    " Likewise, GFiles command with preview window
    " original Gfiles
    " command! -bang -nargs=? -complete=dir GFiles
    "       \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:45%'), <bang>0)

    " command! -bang -nargs=? -complete=dir GFiles
    "       \ call fzf#vim#files(
    "       \   "rg -g '!node_modules' -g '!frontend' ".shellescape(<q-args>),
    "       \   fzf#vim#with_preview('right:45%'), <bang>0)

    " Source For FZF configuration
    " https://www.chrisatmachine.com/Neovim/08-fzf/
    " man page: http://manpages.ubuntu.com/manpages/eoan/man1/fzf.1.html
     let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

    let g:fzf_colors =
          \ { 'fg':    ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }

    let $FZF_DEFAULT_OPTS = '--info=inline'

    " Hides anything from gitignore
    let $FZF_DEFAULT_COMMAND="rg --files --hidden"

    "Get Files
    command! -bang -nargs=? -complete=dir Files
          \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

    " Get text in files with Rg
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview(), <bang>0)

    " Ripgrep advanced
    function! RipgrepFzf(query, fullscreen)
      let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
      let initial_command = printf(command_fmt, shellescape(a:query))
      let reload_command = printf(command_fmt, '{q}')
      let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
      call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
    endfunction

    command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

    " Git grep
    command! -bang -nargs=* GGrep
          \ call fzf#vim#grep(
          \   'git grep --line-number '.shellescape(<q-args>), 0,
          \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


    nmap <Leader>/ :Rg<CR>
    nmap <Leader>gg :Ag!<Space>
    nmap <Leader>C :Commands<CR>
    nmap <Leader>: :History:<CR>
    nmap <Leader>M :Maps<CR>
    nmap <Leader>l :BLines<CR>
    nmap <Leader>L :Lines<CR>
    nmap <Leader>' :Marks<CR>
    nmap <Leader>t :BTags<CR>
    nmap <Leader>T :Tags<CR>
    nmap <Leader>b :Buffers<CR>
    nmap <Leader>h :History<CR>
    nmap <Leader>f :GFiles<CR>
    nmap <Leader>,f :GFiles?<CR>
    nmap <Leader>F :Files!<CR>
  " Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'jasoncodes/ctrlp-modified.vim'
  "   "modified since your last commit
  "   map <Leader><C-b> :CtrlPModified<CR>
  "   "modified on your current branch
  "   map <Leader><C-m> :CtrlPBranch<CR>
  "   "all modified - last two combined
  "   map <Leader><C-a> :CtrlPBranchModified<CR>
  "
  " WHEN ELIXIR: enable when using elixir
  " Plug 'c-brenn/phoenix.vim'
  "
  " Plug 'edkolev/tmuxline.vim'
  "   let g:tmuxline_preset = 'tmux'
  "   let g:tmuxline_preset = {
  "         \'a'    : '#S',
  "         \'win'  : ['#I', '#W'],
  "         \'cwin' : ['#I', '#W', '#F'],
  "         \'y'    : ['%R', '%a', '%Y'],
  "         \'z'    : '#H'}
  "   let g:tmuxline_separators = {
  "         \ 'left' : '',
  "         \ 'left_alt': '>',
  "         \ 'right' : '',
  "         \ 'right_alt' : '<',
  "         \ 'space' : ' '}
  " WHEN ELIXIR: enable when using elixir
  " Plug 'elixir-editors/vim-elixir'

  Plug 'henrik/vim-indexed-search'
  Plug 'jiangmiao/auto-pairs'
  Plug 'jreybert/vimagit'
    let g:magit_default_fold_level = 0

  " WHEN GRAPHQL: enable when using graphql
  " Plug 'jparise/vim-graphql'

  " Rubocop aligns for me
  " Plug 'junegunn/vim-easy-align'
  "   nmap <Leader>a <Plug>(EasyAlign)
  "   vmap <Leader>a <Plug>(EasyAlign)

  " RUN: brew install ctags
  " Run the following in company code repo
  " RUN: ctags -R -f ./.git/tags .
  " INFO: https://andrew.stwrt.ca/posts/vim-ctags/
  " CREATE: ~/.ctags
  Plug 'ludovicchabant/vim-gutentags' "Easily manage tag files
  " gutentags
    let g:gutentags_cache_dir = '~/.tags_cache'
    let g:gutentags_ctags_tagfile = '.tags'
    let g:gutentags_modules = ['ctags']
    let g:gutentags_file_list_command = 'ag -l'
    let g:gutentags_define_advanced_commands = 1
    let g:gutentags_exclude_filetypes = ['vim', 'markdown', 'text', 'config', 'yaml']

  Plug 'rizzatti/dash.vim'
  Plug 'mileszs/ack.vim'
    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    " Borrowed from @skwp
    if executable('ag')
      " set grepprg=ag\ --nogroup\ --nocolor
      " let g:ackprg = 'ag --nogroup --nocolor --column'
      let g:ackprg = 'ag --vimgrep'
    endif

    cnoreabbrev ag Gcd <bar> Ack!
    cnoreabbrev g Ag!
    nnoremap <Leader>k :Gcd <Bar> Ack! <cword><CR>
    nnoremap <Leader>w :Ack <cword><cr>
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'neomake/neomake'

    " Signs and highlighting for errors, etc.
    let s:error_sign = '✘'
    let s:error_sign_hl = 'DiagnosticErrorSign'
    let s:error_hl = 'DiagnosticError'
    let s:error_text_hl = 'DiagnosticErrorText'
    let s:warning_sign = '♦'
    let s:warning_sign_hl = 'DiagnosticWarningSign'
    let s:warning_hl = 'DiagnosticWarning'
    let s:warning_text_hl = 'DiagnosticWarningText'
    let s:info_sign = '→'
    let s:info_sign_hl = 'DiagnosticInfoSign'
    let s:info_hl = 'DiagnosticInfo'
    let s:info_text_hl = 'DiagnosticInfoText'
    let s:hint_sign = '…'
    let s:hint_sign_hl = s:info_sign_hl
    let s:hint_hl = s:info_sign
    let s:hint_text_hl = s:info_text_hl


  " Run Neomake when I save any buffer
    augroup localneomake
      autocmd! BufWritePost * Neomake
    augroup END
    " Don't tell me to use smartquotes in markdown ok?
    let g:neomake_markdown_enabled_makers = []

    " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
    " WHEN ELIXIR: enable when using elixir
    " let g:neomake_elixir_enabled_makers = ['mycredo']
    " function! NeomakeCredoErrorType(entry)
    "   if a:entry.type ==# 'F'      " Refactoring opportunities
    "     let l:type = 'W'
    "   elseif a:entry.type ==# 'D'  " Software design suggestions
    "     let l:type = 'I'
    "   elseif a:entry.type ==# 'W'  " Warnings
    "     let l:type = 'W'
    "   elseif a:entry.type ==# 'R'  " Readability suggestions
    "     let l:type = 'I'
    "   elseif a:entry.type ==# 'C'  " Convention violation
    "     let l:type = 'W'
    "   else
    "     let l:type = 'M'           " Everything else is a message
    "   endif
    "   let a:entry.type = l:type
    " endfunction
    "
    " let g:neomake_error_sign = {
    "       \ 'text': s:error_sign,
    "       \ 'texthl': s:error_sign_hl,
    "       \ }
    " let g:neomake_warning_sign = {
    "       \ 'text': s:warning_sign,
    "       \ 'texthl': s:warning_sign_hl,
    "       \ }
    " let g:neomake_info_sign = {
    "       \ 'text': s:info_sign,
    "       \ 'texthl': s:info_sign_hl,
    "       \ }
    " let g:neomake_message_sign = {
    "       \ 'text': s:hint_sign,
    "       \ 'texthl': s:hint_sign_hl,
    "       \ }
    "
    " let g:neomake_elixir_mycredo_maker = {
    "       \ 'exe': 'mix',
    "       \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
    "       \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
    "       \ 'postprocess': function('NeomakeCredoErrorType')
    "       \ }

  " WHEN ELIXIR: enable when using elixir
  " Plug 'mhinz/vim-mix-format'

  Plug 'rhysd/git-messenger.vim'
    let g:git_messenger_close_on_cursor_moved = v:false
    " let g:git_messenger_no_default_mappings = v:false
    let g:git_messenger_always_into_popup = v:true

    set modifiable
    nmap <Leader>m <Plug>(git-messenger)
  Plug 'scrooloose/nerdtree'
    filetype plugin indent on " required

    "nerdtree toggle
    map <C-n> :NERDTreeToggle<CR>

    "open vertical windows to the right
    let g:NERDTreeWinPos = 0

    " start NERDTree on start-up and focus active window
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p

    let NERDTreeMouseMode=3

    nmap <Leader>n :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

    "change nerd tree width
    let NERDTreeWinSize=40
  Plug 'sheerun/vim-polyglot'

  " WHEN ELIXIR: enable when using elixir - Elixir Sense
  " Plug 'slashmili/alchemist.vim'
  "   let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
  "   let g:alchemist_tag_map = '<C-]>'
  "   let g:alchemist_tag_stack_map = '<C-T>'
  "   let g:alchemist_iex_term_split = 'split'
  "   let g:alchemist_iex_term_size = 15
  "   autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>

  Plug 'tomasr/molokai'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-endwise'
  " Gbrowse enabled
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-fugitive'
    "---------------vim fugitive(git) plugin---------------------
    set nocompatible " use Vim instead of Vi and required for plugin
    autocmd QuickFixCmdPost *grep* cwindow
    nnoremap <Leader>gb :Git blame<cr>
    nnoremap <Leader>ga :Git add %:p<CR><CR>
    nnoremap <Leader>gs :Git<CR>
    nnoremap <Leader>gc :Gcommit -v -q<CR>
    nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>ge :Gedit<CR>
    nnoremap <Leader>gr :Gread<CR>
    nnoremap <Leader>gw :Gwrite<CR><CR>
    " nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
    nnoremap <Leader>gl :0Gclog<CR>
    nnoremap <Leader>gp :Ggrep<Space>
    "nnoremap <Leader>gm :Gmove<Space>
    nnoremap <Leader>go :Git checkout<Space>
  Plug 'tpope/vim-bundler'
  " WHEN ELIXIR: enable when using elixir
  " Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'troydm/zoomwintab.vim'
    nnoremap <c-w>z :ZoomWinTabToggle<CR>
  Plug 'vim-ruby/vim-ruby'
  Plug 'dense-analysis/ale'
    " RUN:
    "$ npm install eslint --save-dev
    "$ ./node_modules/.bin/eslint --init
    "$ npm install prettier --save-dev
    "$ npm install eslint-plugin-prettier --save-dev
    "$ npm install eslint-config-prettier --save-dev

    " ALE linting events
    " augroup ale
    "   autocmd!
    "
    "   " if g:has_async
    "     autocmd VimEnter *
    "           \ set updatetime=1000 |
    "           \ let g:ale_lint_on_text_changed = 0
    "     autocmd CursorHold * call ale#Queue(0)
    "     autocmd CursorHoldI * call ale#Queue(0)
    "     autocmd InsertEnter * call ale#Queue(0)
    "     autocmd InsertLeave * call ale#Queue(0)
    "   " else
    "   "   echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
    "   " endif
    " augroup END

    " ALE linting events
    augroup ale
      autocmd!

      if g:has_async
        autocmd VimEnter *
              \ set updatetime=1000 |
              \ let g:ale_lint_on_text_changed = 0
        autocmd CursorHold * call ale#Queue(0)
        autocmd CursorHoldI * call ale#Queue(0)
        autocmd InsertEnter * call ale#Queue(0)
        autocmd InsertLeave * call ale#Queue(0)
      else
        echoerr "require NeoVim or Vim 8"
      endif
    augroup END

    " Turn on manually
    let g:ale_fix_on_save = 1
    let g:ale_javascript_prettier_use_local_config = 1

    " \ 'elixir': ['dialyxir', 'elixir_ls'],
    let g:ale_linters = {
          \ 'javascript': ['eslint'],
          \ 'ruby': ['rubocop', 'rails_best_practices']
          \ }

    " \ 'elixir': ['mix_format'],
    let g:ale_fixers = {
    \ 'javascript': ['eslint', 'prettier'],
    \ 'json': ['prettier'],
    \ 'ruby': ['remove_trailing_lines', 'trim_whitespace', 'rubocop']
    \ }

    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'

  Plug 'pangloss/vim-javascript'
    let g:javascript_plugin_flow = 1
  Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0
  Plug 'maxmellon/vim-jsx-pretty',   { 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'] }

  " WHEN REACT: enable when using jsx with react
  " Plug 'mattn/emmet-vim'
  "   " let g:user_emmet_leader_key='<Tab>'
  "   let g:user_emmet_leader_key=','
  "   let g:user_emmet_settings = {
  "         \  'javascript.jsx' : {
  "         \      'extends': 'jsx',
  "         \      'quote_char': '"',
  "         \  },
  "         \}
  Plug 'skywind3000/asyncrun.vim'
    autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

  " WHEN YARD: enable when using yard comments
  " Plug 'noprompt/vim-yardoc'
call plug#end()

set background=dark
"syntax enable
syntax on
echo v:scrollstart
colorscheme molokai
set t_Co=256 " MOAR colors

" Change search highlight color
" Needs to be set under the colorscheme
hi Search ctermbg=darkgray
hi Search ctermfg=yellow
" change visual select color
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan


"open my notes
nnoremap <leader>ep :vsp $HOME/threeflow/scratch.md <CR>

" Neovim
" type ,ev to edit the Vimrc
nnoremap <leader>en :vsp $HOME/.config/nvim/init.vim <CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>es :source $MYVIMRC<CR>

" Inspired by:
" https://github.com/bitboxer/dotfiles/blob/master/tilde/config/nvim/
" http://www.smoothterminal.com/articles/neovim-for-elixir
"
" Good Elixir conf
" https://github.com/amacgregor/dot-files/blob/master/vimrc
"
" latest vim configs - zoom, messenger, git
" https://github.com/dzeban/dotfiles/blob/76467fe2b4a6354937ae40831d57b96fa12dcb34/.vimrc

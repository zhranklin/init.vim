function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.vim/plugged')
" looking
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/indentLine'
  Plug 'ryanoasis/vim-devicons'
  Plug 'myusuf3/numbers.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ianks/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
" completion/templating
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'jiangmiao/auto-pairs'
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-endwise'
  Plug 'scrooloose/nerdcommenter'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" command extention
  Plug 'easymotion/vim-easymotion'
  Plug 'wellle/targets.vim'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/vim-easy-align'
  Plug 'wellle/targets.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'repeat.vim'
" utils
  Plug 'neomake/neomake'
  Plug 'kassio/neoterm'
  Plug 'sjl/gundo.vim'
  Plug 'chrisbra/NrrwRgn'
  Plug 'Mark--Karkat'
" misc
  Plug 'asins/vimcdoc'
  Plug 'ccvext.vim'
  Plug 'CodeFalling/fcitx-vim-osx'
  "Plug 'lilydjwg/fcitx.vim'
  Plug 'junegunn/vim-github-dashboard'
" documentation
  Plug 'rhysd/nyaovim-markdown-preview'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-misc'
  Plug 'itchyny/calendar.vim'
  Plug 'junegunn/vim-journal'
" navigation
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'wesleyche/SrcExpl'
  Plug 'majutsushi/tagbar'
  Plug 'taglist.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'eugen0329/vim-esearch'
" c/c++
  Plug 'zhranklin/deoplete-clang'
" java
  Plug 'artur-shaik/vim-javacomplete2'
  "Plug 'vhakulinen/neovim-intellij-complete-deoplete'
" python
  Plug 'zchee/deoplete-jedi'
" html/css/javascript
  Plug 'mattn/emmet-vim'
" scala
  Plug 'ensime/ensime-vim', { 'do': function('DoRemote') }
  Plug 'derekwyatt/vim-scala'
"  Plug 'ktvoelker/sbt-vim'
"  Plug 'megaannum/vimside'
call plug#end()

" Fundamental settings
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  filetype on
  filetype plugin on
  filetype plugin indent on
  syntax on
" Some useful settings
  set smartindent
  set expandtab         "tab to spaces
  set tabstop=2         "the width of a tab
  set shiftwidth=2      "the width for indent
  set foldenable
  set foldmethod=indent "folding by indent
  set foldlevel=99
  set ignorecase        "ignore the case when search texts
  set smartcase         "if searching text contains uppercase case will not be ignored
" Lookings
  set number           "line number
  set cursorline       "hilight the line of the cursor
  set cursorcolumn     "hilight the column of the cursor
  set nowrap           "no line wrapping
  colorscheme gruvbox  "use the theme gruvbox
  set background=dark "use the light version of gruvbox
  " change the color of chars over the width of 80 into blue
  " (uncomment to enable it)
  "au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Shortcuts
  " \\ => go to command mode
    imap <leader><leader> <esc>:
  " go => go to anywhere
    nmap go <Plug>(easymotion-jumptoanywhere)
  " <c-v> => for pasting
    imap <c-v> <esc>"+pa
  " <c-h/j/k/l> => hjkl in normal mode (but there is a bug mapping <c-h>)
    imap <c-h> <left>
    imap <c-j> <down>
    imap <c-k> <up>
    imap <c-l> <right>
  " \cl => redraw the screen
    nmap <leader>l <c-l><c-l>
    imap <leader>l <esc><leader>la
  " <space> => fold/unfold current code
  " tips: zR => unfold all; zM => fold all
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
  " \o => open current file by system apps (only available in osx)
    nmap <leader>o :!open "%"<cr>
    imap <leader>o <esc><leader>o
  " ,, => escape to normal mode
    imap ,, <Esc>
    tmap ,, <Esc>
  " <esc> => go back to normal mode (in terminal mode)
    tnoremap <Esc> <C-\><C-n> 
  " <F4> => popup the file tree navigation)
    nmap <F4> :NERDTreeToggle<CR>
  " use t{h,j,k,l} to switch between different windows
    noremap tk <c-w>k
    noremap tj <c-w>j
    noremap th <c-w>h
    noremap tl <c-w>l
		nmap twj :resize +5<cr>
		nmap twk :resize -5<cr>
		nmap twh :vertical resize -5<cr>
		nmap twl :vertical resize +5<cr>
  " t[number] => switch to the file showed in the top tabs
  " t[ t] => prev tab/next tab
    nmap t1 <Plug>AirlineSelectTab1
    nmap t2 <Plug>AirlineSelectTab2
    nmap t3 <Plug>AirlineSelectTab3
    nmap t4 <Plug>AirlineSelectTab4
    nmap t5 <Plug>AirlineSelectTab5
    nmap t6 <Plug>AirlineSelectTab6
    nmap t7 <Plug>AirlineSelectTab7
    nmap t8 <Plug>AirlineSelectTab8
    nmap t9 <Plug>AirlineSelectTab9
    nmap t[ <Plug>AirlineSelectPrevTab
    nmap t] <Plug>AirlineSelectNextTab
  " ts => toggle the srcExpl (for source code exploring)
    nnoremap ts :SrcExplToggle<CR>
  " tg => toogle the gundo
    nnoremap tg :GundoToggle<CR>
  " tb => open the tagbar
    nmap tb :TlistClose<CR>:TagbarToggle<CR>
  " ti => taglist
    nmap ti :TagbarClose<CR>:Tlist<CR>
  " <s-enter> => toggle the terminal
    if exists('nyaovim_version')
      nnoremap <silent> <s-cr> :Ttoggle<cr>
    else " in terminal use t<enter>
      nmap t<CR> :Ttoggle<CR> 
    endif
  " tt => type the command for the terminal
    nnoremap tt :T<space>
  " te => send current line/selected lines to the terminal
    nnoremap <silent> te :TREPLSend<CR>
    xnoremap <silent> te :TREPLSend<CR>
  " tE => send the thole current file to the terminal
    nnoremap <silent> tE :TREPLSendFile<CR>
  " \t => goto normal mode and press t (e.g. \t<enter> to toggle the terminal)
    imap <leader>t <esc>t
  " tm => toggle the markdown preview
    let g:markdown_preview_on = 0
    au! BufWinEnter *.md,*.markdown,*.mdown let g:markdown_preview_on = g:markdown_preview_auto || g:markdown_preview_on  
    au! BufWinLeave *.md,*.markdown,*.mdown let g:markdown_preview_on = !g:markdown_preview_auto && g:markdown_preview_on  
    nmap tm @=(g:markdown_preview_on ? ':Stop' : ':Start')<CR>MarkdownPreview<CR>:let g:markdown_preview_on = 1 - g:markdown_preview_on<CR>
  " \g => scroll to bottom in markdown preview (insert mode)
    imap <leader>g <esc><leader>Ga
  " \jd => GoTo the definition
    "nnoremap <leader>jd :YcmCompleter GoTo<CR>
  " \e => edit only current/selected line(s) in normal/visual mode
  " z + [fFtTwWbBeE(ge)(gE)jknNs] => easy motion
    map zf <Leader><Leader>f
    map zF <Leader><Leader>F
    map zt <Leader><Leader>t
    map zT <Leader><Leader>T
    map zw <Leader><Leader>w
    map zW <Leader><Leader>W
    map zb <Leader><Leader>b
    map zB <Leader><Leader>B
    map ze <Leader><Leader>e
    map zE <Leader><Leader>E
    map zge <Leader><Leader>ge
    map zgE <Leader><Leader>gE
    map zj <Leader><Leader>j
    map zk <Leader><Leader>k
    map zn <Leader><Leader>n
    map zN <Leader><Leader>N
    map zs <Leader><Leader>s
  " zn => NrrwRgn in normal/visual mode
    nmap zn :NR<CR>
    xmap zn :NR<CR>
  " zm => multipleCursor by regular expression
    nnoremap zm :MultipleCursorsFind<space>
    xnoremap zm :MultipleCursorsFind<space>
    xmap zI zm^<cr>I
    xmap zA zm$<cr>A

" Plugin settings
  " Airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
  " Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*\|: [A-Z]\w*'
    let g:deoplete#sources#clang#libclang_path='/usr/local/opt/llvm/lib/libclang.3.6.dylib'
    let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang/3.6.2/include'
    let g:deoplete#sources#clang#flags = [
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1',
          \ '-isystem',
          \ '/usr/local/include',
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/bin/../lib/clang/7.3.0/include',
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/include',
          \ '-isystem',
          \ '/usr/include',
          \ '-isystem',
          \ '/System/Library/Frameworks',
          \ '-isystem',
          \ '/Library/Frameworks',
          \ ]
  " EasyAlign
    xmap ga <Plug>(LiveEasyAlign)
    nmap ga <Plug>(LiveEasyAlign)
  " EasyMotion
    hi EasyMotionTarget ctermfg=9 guifg=red
    hi EasyMotionTarget2First ctermfg=9 guifg=red
    hi EasyMotionTarget2Second ctermfg=9 guifg=lightred
    hi link EasyMotionShade Comment
  " Emmet
    let g:user_emmet_leader_key = ',z'
  " ESearch
    let g:esearch = {
      \ 'adapter':    'ack',
      \ 'backend':    'nvim',
      \ 'out':        'win',
      \ 'batch_size': 1000,
      \ 'use':        ['visual', 'hlsearch', 'last'],
      \}
  " IndentLine
    let g:indentLine_color_gui = "#504945"
  " Markdown_preview (a plugin in nyaovim)
    let g:markdown_preview_eager = 1
    let g:markdown_preview_auto = 1
  " Multi_cursor
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_start_key='<c-n>'
    let g:multi_cursor_next_key='<tab>'
    let g:multi_cursor_prev_key='b'
    let g:multi_cursor_skip_key='x'
    let g:multi_cursor_quit_key='q'
  " Neomake
    let g:neomake_cpp_enabled_makers = ['clang']
    let g:neomake_cpp_clang_args = ['-Wall', '-Wextra', '-std=c++11', '-o', '%:p:r']
    let g:neomake_cpp_gcc_args = ['-Wall', '-Wextra', '-std=c++11', '-o', '%:p:r']
    let g:neomake_scala_enabled_markers = ['fsc', 'scalastyle']
    let g:neomake_scala_scalac_args = ['-Ystop-after:parser', '-Xexperimental']
  " Neoterm
    let g:neoterm_size=20
    let g:neoterm_repl_command= 'zsh'
    let g:neoterm_position = 'horizontal'
    " toogle the terminal
    " kills the current job (send a <c-c>)
    nnoremap <silent> tc :call neoterm#kill()<cr>
  " Notes
    let g:notes_directories = ['~/Dev/notes-in-vim']
  " Startify
    command! -nargs=1 CD cd <args> | Startify
    autocmd User Startified setlocal cursorline
    let g:startify_enable_special         = 0
    let g:startify_files_number           = 8
    let g:startify_relative_path          = 1
    let g:startify_change_to_dir          = 1
    let g:startify_update_oldfiles        = 1
    let g:startify_session_autoload       = 1
    let g:startify_session_persistence    = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_list_order = [
      \ ['   LRU within this dir:'],
      \ 'dir',
      \ ['   LRU:'],
      \ 'files',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]
    let g:startify_skiplist = [
                \ 'COMMIT_EDITMSG',
                \ 'plugged/.*/doc',
                \ '/data/repo/neovim/runtime/doc',
                \ '.vimrc',
                \ 'nyaovimrc.html',
                \ ]
    let g:startify_bookmarks = [
                \ { 'c': '~/.vimrc' },
                \ { 'y': '~/.config/nyaovim/nyaovimrc.html' },
                \ ]
    let g:startify_custom_footer =
          \ ['', "   I like it!", '']
    highlight StartifyFooter  ctermfg=240
  " Supertab
    let g:SuperTabMappingForward = '<s-tab>'
    let g:SuperTabMappingBackward = '<tab>'
  " Tagbar
    let g:tagbar_width=30
  " Taglist
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1
    let Tlist_File_Fold_Auto_Close=1
    let Tlist_WinWidth=30
    let Tlist_Use_Right_Window=1
  " UltiSnip
  " <tab> => expand the snippets
    let g:UltiSnipsExpandTrigger = '<tab>'
  " <ctrl-d> => list available snippets start with the chars before the cursor
    let g:UltiSnipsListSnippets = '<c-d>'
  " <enter> => go to the next placeholder
    let g:UltiSnipsJumpForwardTrigger = '<enter>'
  " <shift-enter> => go to the previous placeholder
    if exists('g:nyaovim_version')
      let g:UltiSnipsJumpBackwardTrigger = '<s-enter>'
    else "as <shift-enter> can't be handled in terminal, use <ctrl-k> instead
      let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
    endif

" Automatics
  function! ToStartify()
    if winnr("$") == 1 && buffer_name(winbufnr(winnr())) != ""
      vs
      Startify
      exec "normal \<c-w>w"
    endif
  endfunction
  au! QuitPre * call ToStartify()
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePost *.scala :EnTypeCheck
  cd $HOME
  au BufRead,BufNewFile,BufEnter \@!(term://)* cd %:p:h
  au! BufWritePost * Neomake
  autocmd FileType json set nocursorcolumn

nmap ; !!sort\|uniq<CR>
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.config/nvim/plugged')
" looking
  Plug 'mhinz/vim-startify'
  Plug 'Yggdroot/indentLine' "indentLine导致卡顿，原因未知
  Plug 'ryanoasis/vim-devicons'
  Plug 'myusuf3/numbers.vim'
  Plug 'nvim-telescope/telescope.nvim'
"""""""""""""""""""""""""""""""""
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ianks/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
" completion/templating
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
  Plug 'vim-scripts/repeat.vim'
" utils
  Plug 'neomake/neomake'
  Plug 'kassio/neoterm'
  Plug 'sjl/gundo.vim'
  Plug 'chrisbra/NrrwRgn'
  Plug 'vim-scripts/Mark--Karkat'
" misc
  Plug 'asins/vimcdoc'
  Plug 'vim-scripts/ccvext.vim'
"  Plug 'CodeFalling/fcitx-vim-osx'
  "Plug 'lilydjwg/fcitx.vim'
  Plug 'junegunn/vim-github-dashboard'
" documentation
  "Plug 'neilagabriel/vim-geeknote'
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
  Plug 'vim-scripts/taglist.vim'
  Plug 'rizzatti/dash.vim'
  Plug 'eugen0329/vim-esearch'
" html/css/javascript
  Plug 'mattn/emmet-vim'
" scala
  Plug 'nvim-lua/plenary.nvim'
  Plug 'scalameta/nvim-metals'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'mfussenegger/nvim-dap'
  "Plug 'ensime/ensime-vim', { 'do': function('DoRemote') }
  "Plug 'derekwyatt/vim-scala'
  Plug 'mattn/emmet-vim'
" terminal
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()
lua require("toggleterm").setup()
let ensime_server_v2=1

let g:nyaovim_version='0.0.22'

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
  set termguicolors
  " change the color of chars over the width of 80 into blue
  " (uncomment to enable it)
  "au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Shortcuts
    imap <c-a> <esc>ggyG
    vmap <c-c> "+y
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
  " <s-enter> => toggle the terminal, For example: 2<s-enter> will open terminal 2
    autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><s-enter> <Cmd>exe v:count1 . "ToggleTerm"<CR>
    nnoremap <silent><s-enter> <Cmd>exe v:count1 . "ToggleTerm size=9 dir=% direction=horizontal"<CR>
    inoremap <silent><s-enter> <Esc><Cmd>exe v:count1 . "ToggleTerm size=9 dir=% direction=horizontal"<CR>

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
  " Geeknote
    let g:GeeknoteFormat="markdown"
  " IndentLine
    let g:indentLine_color_gui = "#504945"
    let g:indentLine_char = '│'
  " Markdown_preview (a plugin in nyaovim)
    let g:markdown_preview_eager = 1
    let g:markdown_preview_auto = 1
  " Multi_cursor
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_start_key='<c-n>'
    "let g:multi_cursor_next_key='<tab>'
    let g:multi_cursor_prev_key='b'
    let g:multi_cursor_skip_key='x'
    let g:multi_cursor_quit_key='q'
  " Neomake
    let g:neomake_cpp_enabled_makers = ['clang']
    let g:neomake_cpp_clang_args = ['-Wall', '-Wextra', '-Wno-deprecated', '-std=c++11', '-o', '%:p:r']
    "let g:neomake_cpp_gcc_args = ['-Wall', '-Wextra', '-std=c++11', '-o', '%:p:r']
    let g:neomake_scala_enabled_markers = ['fsc', 'scalastyle']
    let g:neomake_scala_scalac_args = ['-Ystop-after:parser', '-Xexperimental']
  " Neoterm
    let g:neoterm_size=20
    let g:neoterm_repl_command= 'zsh'
    " toogle the terminal
    " kills the current job (send a <c-c>)
    nnoremap <silent> tc :call neoterm#kill()<cr>
  " Notes
    let g:notes_directories = ['~/Dev/notes-in-vim']
  " Startify
    command! -nargs=1 CD cd <args> | Startify
    autocmd User Startified setlocal cursorline
    autocmd BufWritePost /Users/zhangwu/.config/karabiner/karabiner.yaml execute '! export X=\",\ \"; cat % | sed "s/\$CAPSLOCK/right_command${X}right_control${X}right_shift${X}right_option/g" | yq ".|to_json" > /Users/zhangwu/.config/karabiner/karabiner.json'
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
                \ { 'c': '~/.config/nvim/init.vim' },
                \ { 'y': '~/.config/nyaovim/nyaovimrc.html' },
                \ ]
    let g:startify_custom_footer =
          \ ['', "   I like it!", '']
    highlight StartifyFooter  ctermfg=240
  " Supertab
    let g:SuperTabMappingForward = '<s-tab>'
    "let g:SuperTabMappingBackward = '<tab>'
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
    "let g:UltiSnipsExpandTrigger = '<tab>'
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
  " AutoPair
    let g:AutoPairsShortcutToggle = ''

" Automatics
  "function! ToStartify()
  "  if winnr("$") == 1 && buffer_name(winbufnr(winnr())) != "Startify"
  "    vs
  "    Startify
  "    exec "normal \<c-w>w"
  "  endif
  "endfunction
"  au! QuitPre * call ToStartify()
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePost *.scala silent :EnTypeCheck
  au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
  au BufRead,BufNewFile,BufEnter \@!(term://)* cd %:p:h
  au! BufWritePost * Neomake
  autocmd FileType json set nocursorcolumn


function! Metals_status() abort
  return get(g:, 'metals_status', '')
endfunction
function! MyPlugin(...)
  if &filetype == 'scala'
    let w:airline_section_c = 'Metals: %{Metals_status()}'
    let g:airline_variable_referenced_in_statusline = 'foo'
  endif
endfunction
call airline#add_statusline_func('MyPlugin')

inoremap 1 !
inoremap 2 @
inoremap 3 #
inoremap 4 $
inoremap 5 %
inoremap 6 ^
inoremap 7 &
inoremap 8 *
inoremap ! 1
inoremap @ 2
inoremap # 3
inoremap $ 4
inoremap % 5
inoremap ^ 6
inoremap & 7
inoremap * 8
inoremap ( 9
inoremap ) 0

" 需要将~/.config/nvim/plugged/auto-pairs/plugin/auto-pairs.vim
" 中的AutoPairsMap函数改成:
" func! AutoPairsMap(key)
"   let key = a:key
"   if key == '|'
"     let key = '<BAR>'
"   end
"   let escaped_key = substitute(key, "'", "''", 'g')
"   if key == '('
"     execute 'inoremap <buffer> <silent> '.9." <C-R>=AutoPairsInsert('".escaped_key."')<CR>"
"   elseif key == ')'
"     execute 'inoremap <buffer> <silent> '.0." <C-R>=AutoPairsInsert('".escaped_key."')<CR>"
"   else
"     execute 'inoremap <buffer> <silent> '.key." <C-R>=AutoPairsInsert('".escaped_key."')<CR>"
"   end
" endf


lua <<EOF

-------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built-in
-- LSP. Be sure to thoroughly read the `:help nvim-metals` docs to get an
-- idea of what everything does. Again, these are meant to serve as an example,
-- if you just copy pasta them, then should work,  but hopefully after time
-- goes on you'll cater them to your own liking especially since some of the stuff
-- in here is just an example, not what you probably want your setup to be.
--
-- Unfamiliar with Lua and Neovim?
--  - Check out https://github.com/nanotee/nvim-lua-guide
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore is a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmp
--   - hrsh7th/cmp-nvim-lsp for lsp completion sources
--   - hrsh7th/cmp-vsnip for snippet sources
--   - hrsh7th/vim-vsnip for snippet sources
--
-- - https://github.com/wbthomason/packer.nvim for package management
-- - https://github.com/mfussenegger/nvim-dap (for debugging)
-------------------------------------------------------------------------------
local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "gD",  vim.lsp.buf.definition)
map("n", "K",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gds", vim.lsp.buf.document_symbol)
map("n", "gws", vim.lsp.buf.workspace_symbol)
map("i", "<leader>cl", vim.lsp.codelens.run)
map("i", "<m-p>", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.formatting)
map("i", "<leader>ca", vim.lsp.buf.code_action)

map("n", "<leader>ws", function()
  require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", function()
  require("dap").continue()
end)

map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end)

map("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end)

map("n", "<leader>dso", function()
  require("dap").step_over()
end)

map("n", "<leader>dsi", function()
  require("dap").step_into()
end)

map("n", "<leader>dl", function()
  require("dap").run_last()
end)

-- completion related settings
-- This is similiar to what I use
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = 'nvim_lsp_signature_help' },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})

----------------------------------
-- LSP Setup ---------------------
----------------------------------
local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  serverVersion = "0.11.11",
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  fallbackScalaVersion = "3.2.2",
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
-- metals_config.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
end
metals_config.init_options.statusBarProvider = "on"

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
EOF

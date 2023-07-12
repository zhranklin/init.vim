vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "ucs-bom,utf-8,gbk,cp936,latin-1"
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.smartindent = true
vim.opt.expandtab = true        -- tab to spaces
vim.opt.tabstop = 2         -- the width of a tab
vim.opt.shiftwidth = 2      -- the width for indent
vim.opt.foldenable = true
vim.opt.foldmethod = "indent" -- folding by indent
vim.opt.foldlevel = 99
vim.opt.ignorecase = true        -- ignore the case when search texts
vim.opt.smartcase = true         -- if searching text contains uppercase case will not be ignored
vim.opt.number = true           -- line number
vim.opt.cursorline = true       -- hilight the line of the cursor
vim.opt.cursorcolumn = true     -- hilight the column of the cursor
vim.opt.wrap = false           -- no line wrapping
vim.opt.background = "dark" -- use the light version of gruvbox
vim.opt.termguicolors = true
vim.opt.updatetime = 400
vim.cmd[[ filetype on ]]
vim.cmd[[ filetype plugin on ]]
vim.cmd[[ filetype plugin indent on ]]
vim.cmd[[ syntax on ]]

-- 高亮复制内容
local au = vim.api.nvim_create_autocmd
au("TextYankPost", {
  pattern = '*',
  command = "silent! lua vim.highlight.on_yank{higroup=\"Visual\", timeout=3000}",
})

-- 自动刷新karabiner
au("BufWritePost ", {
  pattern = '*/karabiner.yaml',
  command = "silent! ! ./%"
}) 

au("BufReadPost", {
  pattern = "*",
  callback = function()
    line = vim.fn.line
    if line("'\"") > 1 and line("'\"") <= line("$") then
      vim.cmd[[exe "normal! g'\""]]
    end
  end
})

-- quickfix窗口中按esc或q退出
vim.cmd[[autocmd FileType qf nnoremap <buffer><silent> <esc> :quit<cr>]]
vim.cmd[[autocmd FileType qf nnoremap <buffer><silent> q :quit<cr>]]


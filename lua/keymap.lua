require('legendary').setup({ which_key = { auto_register = true } })
local wk = require("which-key")
-- LSP mappings
wk.register {
  g = {
    d = { vim.lsp.buf.definition, 'Goto -> Definition' },
    D = { vim.lsp.buf.definition, 'Goto -> Definition' },
    i = { vim.lsp.buf.implementation, 'Goto -> Implementation' },
    r = { vim.lsp.buf.references, 'Goto -> Reference' },-- 如果希望通过telescope预览, 请绑定到 ":Telescope lsp_references\n"
    --map("n", "gds", vim.lsp.buf.document_symbol)
  },
  K = { vim.lsp.buf.hover, 'Show Hover' },
  ['<m-m>'] = { require("telescope").extensions.metals.commands, 'Metals Commands'},
  --map("n", "gws", vim.lsp.buf.workspace_symbol)
  --map("i", "<leader>cl", vim.lsp.codelens.run)
  ['<m-p>'] = { vim.lsp.buf.signature_help, 'Signature Help', mode='i'},
  ['<m-enter>'] = { ':CodeActionMenu<CR>', 'Code Action', mode={'n','i'}},
  ['<leader>'] = {
    rn = { vim.lsp.buf.rename, 'Rename', mode={'n','i'}},
    f = { vim.lsp.buf.format, 'Format Code' },
    ca = {  ':CodeActionMenu<CR>', 'Code Action(<m-enter>)', mode={'n','i'}},
    aa = { vim.diagnostic.setqflist, 'Show All Diagnostics' },
    ae = { function() vim.diagnostic.setqflist({ severity = "E" }) end, 'Show Error Diagnostics' },
    ae = { function() vim.diagnostic.setqflist({ severity = "W" }) end, 'Show Warning Diagnostics' },
    d = { vim.diagnostic.setloclist, 'Diagnostics in Current File' },
    --map("n", "<leader>ws", function() require("metals").hover_worksheet() end)
    --map("n", "[c", function() vim.diagnostic.goto_prev({ wrap = false }) end) -- 上一个diagnostic
    --map("n", "]c", function() vim.diagnostic.goto_next({ wrap = false }) end) -- 下一个diagnostic
  },
  -- Mappings for usage with nvim-dap
  ['<leader>d'] = {
    name = 'dap',
    c = { function() require("dap").continue() end, '' },
    r = { function() require("dap").repl.toggle() end, '' },
    K = { function() require("dap.ui.widgets").hover() end, '' },
    t = { function() require("dap").toggle_breakpoint() end, '' },
    so = { function() require("dap").step_over() end, '' },
    si = { function() require("dap").step_into() end, '' },
    l = { function() require("dap").run_last() end, ''},
  },
}

wk.register {
    ['<c-a>'] = { require('legendary').find, 'Find Actions(Open Legendary Window)' },
}
local window_move_notify_record = nil
function windowMoveF(key, dir)
  return function()
    vim.cmd('wincmd '..key)
    window_move_notify_id = require'notify'("向"..dir.."移动一个窗口", 'info', {title='窗口移动', timeout=500, replace=window_move_notify_id, on_close=function()window_move_notify_id=nil end} ).id
  end
end
wk.register {
  silent=true,
  ['<c-'] = {
    ['a>'] = { function() vim.cmd[[%y+]]; require'notify'("Successfully copied all content to the clipboard.", 'info', {title='Clipboard'}) end, 'Copy All(Insert Mode)', mode='i' },
    ['c>'] = { [["+y:lua require'notify'("Successfully copied to the clipboard.", 'info', {title='Clipboard'})<cr>]], 'Copy to Clipboard', mode='v' },
  },
  z = (function()
    local res = {noremap=false}
    table.foreach({'f', 'F', 't', 'T', 'w', 'W', 'b', 'B', 'e', 'E', 'ge', 'gE', 'j', 'k', 'n', 'N', 's'}, function(_, v)
      res[v] = {'<Leader><Leader>' .. v, 'EasyMotion ' .. v} end)
    return res
  end)(),
  go = {'<Plug>(easymotion-jumptoanywhere)', 'Go to Anywhere', noremap = false},
  t = {
    k = {windowMoveF('k', '上'), 'Switch to Up Window'},
    j = {windowMoveF('j', '下'), 'Switch to Down Window'},
    h = {windowMoveF('h', '左'), 'Switch to Up Window'},
    l = {windowMoveF('l', '右'), 'Switch to Up Window'},
    wj = {':resize +5<cr>', 'Increase the Height'},
    wk = {':resize -5<cr>', 'Decrease the Height'},
    wh = {':vertical resize -10<cr>', 'Decrease the Width'},
    wl = {':vertical resize +10<cr>', 'Increase the Width'},
    noremap=false,
  },
}

wk.register {
  silent=true,
  ['<esc>'] = {'<C-\\><C-n>', 'Go Back to Normal Mode', mode='t'},
  ['<s-'] = { ['enter>'] = {[[<Cmd>exe v:count1 . "ToggleTerm size=9 dir=% direction=horizontal"<CR>]], 'Toggle Terminal', mode='n'}},
  ['<s-enter>'] = {[[<Esc><Cmd>exe v:count1 . "ToggleTerm size=9 dir=% direction=horizontal"<CR>]], 'Toggle Terminal', mode='i'},
}
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = 'term://*toggleterm#*',
  callback = function() vim.cmd[[tnoremap <silent><s-enter> <Cmd>exe v:count1 . "ToggleTerm"<CR>]] end,
})

wk.register {
  mode='i',
  ['1'] = {'!',''},
  ['2'] = {'@',''},
  ['3'] = {'#',''},
  ['4'] = {'$',''},
  ['5'] = {'%',''},
  ['6'] = {'^',''},
  ['7'] = {'&',''},
  ['8'] = {'*',''},
  ['!'] = {'1',''},
  ['@'] = {'2',''},
  ['#'] = {'3',''},
  ['$'] = {'4',''},
  ['%'] = {'5',''},
  ['^'] = {'6',''},
  ['&'] = {'7',''},
  ['*'] = {'8',''},
}

wk.register {
  name='git',
  [']c'] = {function() if vim.wo.diff then return ']c' end
              vim.schedule(function() package.loaded.gitsigns.next_hunk() end)
              return '<Ignore>'
            end, 'Next Git Diff', expr=true},
  ['[c'] = {function() if vim.wo.diff then return '[c' end
              vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)
              return '<Ignore>'
            end, 'Previous Git Diff', expr=true},
  ['<leader>'] = {
    gs = {function() package.loaded.gitsigns.stage_hunk() end, 'Stage Current Diff'},
    gr = {function() package.loaded.gitsigns.reset_hunk() end, 'Revert Current Diff'},
    gS = {function() package.loaded.gitsigns.stage_buffer() end, 'Stage File'},
    gu = {function() package.loaded.gitsigns.undo_stage_hunk() end, 'Undo Stage'},
    gR = {function() package.loaded.gitsigns.reset_buffer() end, 'Revert File'},
    gp = {function() package.loaded.gitsigns.preview_hunk() end, 'Preview Diff'},
    gb = {function() package.loaded.gitsigns.blame_line{full=true} end, ''},
    gd = {function() package.loaded.gitsigns.diffthis() end, 'Show Current File Diff'},
    gD = {function() package.loaded.gitsigns.diffthis('~') end, 'Show Current File Diff(~?)'},
    tb = {function() package.loaded.gitsigns.toggle_current_line_blame() end, ''},
    td = {function() package.loaded.gitsigns.toggle_deleted() end, '(Toggle)Show Deleted Lines'},
  },
  ['<leader>h'] = {
    mode='v',
    s = {function() package.loaded.gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'Stage', mode='v'},
    r = {function() package.loaded.gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, 'Reset', mode='v'},
  },
  ig = {'{:<C-U>Gitsigns select_hunk<CR>', 'Current Git Diff', mode={'o', 'x'}},
}


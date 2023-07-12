local function nN(char)
    local ok, winid = require('hlslens').nNPeekWithUFO(char)
    if ok and winid then
      vim.keymap.set('n', '<CR>', function()
        local keyCodes = api.nvim_replace_termcodes('<Tab><CR>', true, false, true)
        api.nvim_feedkeys(keyCodes, 'im', false)
      end, {buffer = true})
    end
end

local function nextStar()
  require('hlslens').nNPeekWithUFO('N')
  nN('n')
end

local function config()
  require('hlslens').setup()
  local kopts = {noremap = true, silent = true}
  vim.keymap.set({'n', 'x'}, 'n', function() require('plugins.hlslens').nN('n') end)
  vim.keymap.set({'n', 'x'}, 'N', function() require('plugins.hlslens').nN('N') end)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('plugins.hlslens').nextStar('n')<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('plugins.hlslens').nextStar('n')<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
end

local function setup(use)
  use {
    'kevinhwang91/nvim-hlslens',
    config = config
  }
end

return {
  nextStar = nextStar,
  setup = setup,
  nN = nN
}


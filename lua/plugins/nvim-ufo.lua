local statuscol = {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup{
      relculright = true,
      segments = {
        {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
        {text = {"%s"}, click = "v:lua.ScSa"},
        {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
      }
    }
  end
}
local function config()
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  -- tips: zR => unfold all; zM => fold all
  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  vim.keymap.set('n', '<space>', "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>")
  require('ufo').setup{
    provider_selector = function(bufnr, filetype, buftype)
      return {'treesitter', 'indent'}
    end
  }
end

local function setup(use)
  use {
    'kevinhwang91/nvim-ufo',
    requires = { 'kevinhwang91/promise-async', statuscol },
    config = config
  }
end

return {
  setup = setup
}


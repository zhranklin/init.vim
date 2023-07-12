local function setup(use)
  use {
    'mrjones2014/legendary.nvim',
    config = function()
      require('legendary').setup{}
    end
  }
  use {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup{}
    end
  }
end

return {
  setup = setup
}


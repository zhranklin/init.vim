local function setup(use)
  use { 'folke/neodev.nvim', -- brew install lua-language-server
    requires = {
      'neovim/nvim-lspconfig'
    },
    config = function()
      -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
      })
      
      -- then setup your lsp server as usual
      local lspconfig = require('lspconfig')
      
      -- example to setup lua_ls and enable call snippets
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })
    end
  }
end

return {
  setup = setup,
}

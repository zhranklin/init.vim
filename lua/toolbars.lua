local function setup(use)
  -- 显示代码结构(类、方法等)的插件, 目前无法在scala-cli下使用
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  }
  -- 文件浏览器 ctrl-1切换
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup()
      local api = require "nvim-tree.api"
      vim.keymap.set("n", "<c-1>", api.tree.toggle)
    end,
  }

  use {
    'NeogitOrg/neogit',
    config = function()
      local neogit = require('neogit').setup {}
      -- ctrl+9 呼出git窗口
      vim.keymap.set('n', '<c-9>', function()
        if vim.fn.bufnr("NeogitStatus") == -1 then
          vim.cmd[[Neogit kind=vsplit]]
        else
          vim.cmd[[execute 'bd ' . bufnr("NeogitStatus")]]
        end
      end)
    end
  }
-- terminal
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup()
    end,
  }
  -- 显示代码结构(类、方法等)的插件, 目前无法在scala-cli下使用
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup {
          keymaps = {
            ["j"] = "actions.down_and_scroll",
            ["k"] = "actions.up_and_scroll",
          },
          autojump = true,
          backends = {
            ['_']  = {"treesitter", "lsp", "markdown", "man"},
            python = {"treesitter"},
            rust   = {"lsp"},
            scala = {"lsp"},
          },
      }
      vim.keymap.set('n', '<c-7>', '<cmd>AerialToggle!<CR>')
    end
  }
end

return {
  setup = setup
}

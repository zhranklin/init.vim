local function setup(use)
  use {
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end
  }

  use {
    'junegunn/fzf', run = function()
      vim.fn['fzf#install']()
    end
  }

  -- 搜索查询窗口, 通过ctrl+t呼出
  -- brew install ripgrep # 用来做文件内容搜索
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim'
    },
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = "close"
            }
          }
        },
      }
      require('telescope').load_extension('fzy_native')
      vim.keymap.set("n", "<c-t>", ":Telescope\n")
      vim.keymap.set("i", "<c-t>", "<esc>:Telescope\n")
    end
  }
  -- 支持yaml字段搜索
  -- :YAMLView
  use {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

end

return {
  setup = setup
}

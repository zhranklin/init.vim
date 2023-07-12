local function setup(use)
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "vim", "vimdoc", "scala", "yaml" },
        highlight = {
          enable = true,
          disable = { "c", "rust" }, -- 使用metals的高亮, 更精准一些
        },
      }
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = vim.fn['nvim_treesitter#foldexpr']()
      -- 关闭自带的折叠
      vim.opt.foldenable = false
    end
  }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', -- 主要是为了支持af指定一个yaml字段, 例如daf删除当前所在字段
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = { ["af"] = "@assignment.outer" },
            selection_modes = { ['@assignment.outer'] = 'v' },
            include_surrounding_whitespace = true,
          },
        },
      }
    end
  }
end

return {
  setup = setup
}

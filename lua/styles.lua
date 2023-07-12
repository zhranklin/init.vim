local function setup(use)
  use { 'folke/tokyonight.nvim', -- 配色
    config = function()
      vim.cmd[[colorscheme tokyonight-moon]]
    end,
  }
  use 'ryanoasis/vim-devicons' -- 图标
  use 'nvim-tree/nvim-web-devicons' -- 图标
  --use 'airblade/vim-gitgutter' -- 左边栏显示git修改状态
  use { 'nkakouros-original/numbers.nvim', -- 优化左边栏数字显示
    config = function()
      require('numbers').setup {
        excluded_filetypes = {
          'nerdtree',
          'NvimTree',
          'aerial'
        }
      }
    end
  }
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  --use { 'f-person/git-blame.nvim', -- git blame
  --  config = function()
  --    vim.g.gitblame_date_format = '%r(%Y-%m-%d)'
  --  end
  --}

  -- 高亮显示当前所在symbol
  use { 'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure{}
    end
  }

end
return {
  setup = setup,
}

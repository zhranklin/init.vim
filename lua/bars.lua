local function setup(use)
  -- 底下的状态栏
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_c = { 'filename', require('scala').status }
        }
      }
    end
  }

  -- 顶上的文件栏
  use {
    'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      -- hover关闭按钮
      vim.opt.mousemoveevent = true
      require("bufferline").setup {
        options = {
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          indicator = {
            style = 'underline'
          },
        }
      }
      -- gb切换文件
      vim.cmd[[nnoremap <silent> gb :BufferLinePick<CR>]]
    end
  }
end

return {
  setup = setup
}


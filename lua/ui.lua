local function setup(use)
  use{ 'weilbith/nvim-code-action-menu', -- Code Action窗口优化
    cmd = 'CodeActionMenu',
  }
  use { 'kosayoda/nvim-lightbulb', -- lsp code action灯泡提示
    config = function()
      require('nvim-lightbulb').setup({autocmd = {enabled = true}})
    end
  }
  -- quickfix窗口会给出预览, 包括vim.lsp.buf.references()、诊断等
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use {
    'stevearc/dressing.nvim', -- 优化输入/选择交互, 改为弹窗形式
    config = function()
      require('dressing').setup {
        select = {
          backend = { "fzf_lua", "fzf", "builtin", "nui" },
        }
      }
    end
  }
end
return {
  setup = setup,
}

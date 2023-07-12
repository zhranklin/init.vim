local function setup(use)
  -- 支持添加/修改括号等, 如ysaw(, ysaw)
  use 'tpope/vim-surround'
  use 'vim-scripts/repeat.vim' --支持重复surround操作
  -- 增强跳转, 用法: z+跳转, 如zf, zj, dzj, yzj等等
  use {
    'easymotion/vim-easymotion', -- 高级跳转 看下文档
    config = function()
      vim.cmd[[hi EasyMotionTarget ctermfg=9 guifg=red]]
      vim.cmd[[hi EasyMotionTarget2First ctermfg=9 guifg=red]]
      vim.cmd[[hi EasyMotionTarget2Second ctermfg=9 guifg=lightred]]
      vim.cmd[[hi link EasyMotionShade Comment]]
    end,
  }
end
local function mini_pairs()
  require('mini.pairs').setup {
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      ['9'] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
      ['0'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
      ['('] = { action = 'open', pair = '9', neigh_pattern = '$1' }, -- 最后的正则是故意让他匹配不上的, 为了让它失效
      [')'] = { action = 'open', pair = '0', neigh_pattern = '$1' }, -- 最后的正则是故意让他匹配不上的, 为了让它失效
      --['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
      --['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
      --[']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
      --['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
      --['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
      --["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
      --['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
  }
end

return {
  setup = setup,
  mini_pairs = mini_pairs,
}

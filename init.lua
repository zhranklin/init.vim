require'settings'
local packer_bootstrap = require'plugins.packer'.ensure_packer()
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'asins/vimcdoc' -- vim中文文档
  require'plugins.treesitter'.setup(use) -- 语法解析, 高效高亮, 以及aerial对scala脚本的支持依赖这个
  require'styles'.setup(use) -- 编辑区显示优化, 包括行号等
  require'styles-indent'.setup(use) -- 缩进条显示
  require'ui'.setup(use)
  require'plugins.notify'.setup(use)
  require'plugins.startify'.setup(use)
  require'plugins.telescope'.setup(use)
  require'plugins.which-key'.setup(use) -- 按键绑定提示与搜索(which-key, legendary)
  require'toolbars'.setup(use) -- ctrl-1, ctrl-9呼出文件系统(nvim-tree)、git(neogit)
  require'plugins.nvim-ufo'.setup(use) --空格折叠
  require'plugins.hlslens'.setup(use) -- 优化'/'命令视图
  require'scala'.setup(use)
  require'bars'.setup(use) -- gb切换文件
  require'motions'.setup(use) --跳转增强
  use{ 'echasnovski/mini.nvim',
    config = function()
      require('styles-indent').mini_indentscope()
      require('motions').mini_pairs() --加载pairs插件
    end
  }
  use 'tpope/vim-endwise' -- 在if后面自动补全end
-- use 'sjl/gundo.vim' -- 撤销历史插件, 但好像没用了

  if packer_bootstrap then
    require('packer').sync()
  end
end)
require'keymap'

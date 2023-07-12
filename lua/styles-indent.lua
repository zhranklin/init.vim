local function setup(use)
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.cmd [[
      highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
      highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
      highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
      highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
      highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
      highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine
      ]]
      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"
      vim.opt.listchars:append "eol:↴"
      vim.g.indent_blankline_filetype_exclude = { "lspinfo", "packer", "checkhealth", "help", "man", "startify", "" } 
      require("indent_blankline").setup {
        char = "┊",
        show_end_of_line = true,
        space_char_blankline = " ",
        char_highlight_list = { "IndentBlanklineIndent1", "IndentBlanklineIndent2", "IndentBlanklineIndent3", "IndentBlanklineIndent4", "IndentBlanklineIndent5", "IndentBlanklineIndent6", },
      }
    end
  }
end

local function mini_indentscope()
  require('mini.indentscope').setup {
    draw = {
      delay = 10,
      animation = function(s, n)
        local r = 150 / n
        local min = 7
        if r > min then
          return r
        else
          return min
        end
      end,
    },
    symbol = '│' --'┊╎▏│'
  }
end

return {
  mini_indentscope = mini_indentscope,
  setup = setup,
}

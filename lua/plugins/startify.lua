local function setup(use)
  use {
    'mhinz/vim-startify',
    config = function()
      vim.g.startify_enable_special         = 0
      vim.g.startify_files_number           = 8
      vim.g.startify_relative_path          = 1
      vim.g.startify_change_to_dir          = 1
      vim.g.startify_update_oldfiles        = 1
      vim.g.startify_session_autoload       = 1
      vim.g.startify_session_persistence    = 1
      vim.g.startify_session_delete_buffers = 1
      vim.g.startify_list_order = {
        {'   LRU within this dir:'}, 'dir',
        {'   LRU:'}, 'files',
        {'   Sessions:'}, 'sessions',
        {'   Bookmarks:'}, 'bookmarks',
      }
      vim.g.startify_skiplist = {
        'COMMIT_EDITMSG',
        'plugged/.*/doc',
        '/data/repo/neovim/runtime/doc',
        '.vimrc',
        'nyaovimrc.html',
      }
      vim.g.startify_bookmarks = {
        { c = '~/.config/nvim/init.vim' },
        { y = '~/.config/nyaovim/nyaovimrc.html' },
      }
      vim.g.startify_custom_footer = {'', "   I like it!", ''}
      vim.cmd[[command! -nargs=1 CD cd <args> | Startify]]
      vim.api.nvim_create_autocmd("User", {
        pattern = "Startified",
        command = "setlocal cursorline"
      })
      vim.cmd[[highlight StartifyFooter  ctermfg=240]]
    end
  }
end

return {
  setup = setup,
}

-------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built-in
-- LSP. Be sure to thoroughly read the `:help nvim-metals` docs to get an
-- idea of what everything does. Again, these are meant to serve as an example,
-- if you just copy pasta them, then should work,  but hopefully after time
-- goes on you'll cater them to your own liking especially since some of the stuff
-- in here is just an example, not what you probably want your setup to be.
--
-- Unfamiliar with Lua and Neovim?
--  - Check out https://github.com/nanotee/nvim-lua-guide
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore is a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmp
--   - hrsh7th/cmp-nvim-lsp for lsp completion sources
--   - hrsh7th/cmp-vsnip for snippet sources
--   - hrsh7th/vim-vsnip for snippet sources
--
-- - https://github.com/wbthomason/packer.nvim for package management
-- - https://github.com/mfussenegger/nvim-dap (for debugging)
-------------------------------------------------------------------------------
local function config()
  local function metals_status_handler(err, status, ctx)
    local val = {}
    -- trim and remove spinner
    local text = status.text:gsub('[⠇⠋⠙⠸⠴⠦]', ''):gsub("^%s*(.-)%s*$", "%1")
    if status.hide then
      val = {kind = "end"}
    elseif status.show then
      val = {kind = "begin", title = text}
    elseif status.text then
      val = {kind = "report", message = text}
    else
      return
    end
    local msg = {token = "metals", value = val}
    vim.lsp.handlers["$/progress"](err, msg, ctx)
  end
  


  local api = vim.api
  local cmd = vim.cmd
  local map = vim.keymap.set
  
  vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
  
  -- completion related settings
  -- This is similiar to what I use
  local cmp = require("cmp")
  cmp.setup({
    -- 为补全窗口设置边框
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      --{ name = 'nvim_lsp_signature_help' },
      { name = "cmp_git" },
		  { name = "path" },
		  { name = "buffer", keyword_length = 5, max_item_count = 5 },
    },
    snippet = {
      expand = function(args)
        -- Comes from vsnip
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      -- None of this made sense to me when first looking into this since there
      -- is no vim docs, but you can't have select = true here _unless_ you are
      -- also using the snippet stuff. So keep in mind that if you remove
      -- snippets you need to remove this select
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- I use tabs... some say you should stick to ins-completion but this is just here as an example
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    }),
    formatting = {
      fields = {
		  	cmp.ItemField.Kind,
		  	cmp.ItemField.Abbr,
		  	cmp.ItemField.Menu,
		  },
      format = require('lspkind').cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      })
    }
  })
  
  -- Debug settings if you're using nvim-dap
  local dap = require("dap")
  
  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }
  
  local metals_config = require("metals").bare_config()
  metals_config.settings = {
    javaHome = "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home",
    serverVersion = "0.11.12+191-56386a37-SNAPSHOT",
    showImplicitArguments = true,
    showInferredType = true,
    showImplicitConversionsAndClasses = true,
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    fallbackScalaVersion = "3.3.0",
    enableSemanticHighlighting = true,
  }
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  metals_config.on_attach = function(client, bufnr)
    require("metals").setup_dap()
  end
  metals_config.init_options.statusBarProvider = "on"
  metals_config.handlers = { ['metals/status'] = metals_status_handler }

  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
  api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function() require("metals").initialize_or_attach(metals_config) end,
    group = nvim_metals_group,
  })


  local signature_config = {
    log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = true,
    hint_enable = false,
    handler_opts = { border = "single" },
    max_width = 80,
    bind = true, -- This is mandatory, otherwise border config won't get registered.
  }
  
  require("lsp_signature").setup(signature_config)
  

end

local function setup(use)
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      --'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind.nvim', --添加图标到补全中
      'ray-x/lsp_signature.nvim',
    }
  }
  use {
    'scalameta/nvim-metals',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = config
  }

end

local function metals_status()
  local m = vim.g.metals_status
  if m == nil or m == '' then
    return ''
  else
    return 'Metals: ' .. m
  end
end

return {
  setup = setup,
  status = metals_status,
}


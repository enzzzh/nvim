return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept", "fallback" },
      },
      appearance = { nerd_font_variant = "mono" },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      completion = {
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
        },
        menu = { border = "rounded" },
        documentation = { auto_show = true, window = { border = "rounded" } },
        ghost_text = { enabled = true },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")

      lspconfig.util.default_config.capabilities = blink.get_lsp_capabilities(
        lspconfig.util.default_config.capabilities
      )

      vim.diagnostic.config({
        virtual_text = { prefix = "•", spacing = 4 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "•",
            [vim.diagnostic.severity.WARN]  = "•",
            [vim.diagnostic.severity.HINT]  = "•",
            [vim.diagnostic.severity.INFO]  = "•",
          },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = { border = "rounded", source = "always" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = bufnr })
          end

          map("gd", vim.lsp.buf.definition)
          map("gr", vim.lsp.buf.references)
          map("K", vim.lsp.buf.hover)
          map("<leader>ca", vim.lsp.buf.code_action)
          map("<leader>cr", vim.lsp.buf.rename)

          map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
          map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
        end,
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        rust_analyzer = {},
        clangd = {},    -- C / C++
        ts_ls = {},     -- JavaScript / TypeScript
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            lspconfig[server_name].setup(server_opts)
          end,
        },
      })
    end,
  },
}

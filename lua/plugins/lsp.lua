return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "cssls",
          "html",
          "emmet_ls",
          "ts_ls",
          "gopls",
          "svelte",
          "clangd",
          "java_language_server",
          "jdtls",
          "pyright",
          "pylsp",
          "jinja_lsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local emmetCapabilities = vim.lsp.protocol.make_client_capabilities()
      emmetCapabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.emmet_ls.setup({
        -- on_attach = on_attach,
        capabilities = emmetCapabilities,
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "typescriptreact",
          "vue",
        },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        },
      })

      lspconfig.html.setup({
        capabilities = lsp_capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = lsp_capabilities,
      })

      -- lsp lua
      lspconfig.lua_ls.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      -- lsp javascript
      lspconfig.ts_ls.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      -- lsp svelte
      lspconfig.svelte.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      -- lsp go
      lspconfig.gopls.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })
      
      -- lsp C/C++
      lspconfig.clangd.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      -- lsp rust
      lspconfig.rust_analyzer.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })
      -- lsp Java
      lspconfig.jdtls.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      -- lsp Python
      lspconfig.pyright.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })
      lspconfig.pylsp.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })
      lspconfig.jinja_lsp.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = true
        end,
      })

      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<A-p>", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end,
  },
}

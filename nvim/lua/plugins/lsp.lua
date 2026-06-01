-- ElixirLS via Mason, wired with Neovim 0.11's native vim.lsp.config / vim.lsp.enable API.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", config = true },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Buffer-local keymaps once a server attaches.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gri", vim.lsp.buf.implementation, "Go to implementation")
          map("grr", vim.lsp.buf.references, "References")
          map("grn", vim.lsp.buf.rename, "Rename")
          map("gra", vim.lsp.buf.code_action, "Code action")
          map("K", vim.lsp.buf.hover, "Hover docs")
        end,
      })

      -- ElixirLS settings (merged onto the config nvim-lspconfig ships).
      vim.lsp.config("elixirls", {
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = false,          -- don't auto-fetch deps on open
            enableTestLenses = false,
            suggestSpecs = true,
          },
        },
      })

      -- Mason maps lspconfig name "elixirls" -> package "elixir-ls" and downloads it.
      require("mason-lspconfig").setup({
        ensure_installed = { "elixirls" },
        automatic_enable = true,        -- calls vim.lsp.enable() for installed servers
      })
    end,
  },
}

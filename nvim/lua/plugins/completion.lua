-- Completion via blink.cmp (modern, fast). Swap for nvim-cmp here if preferred.
return {
  {
    "saghen/blink.cmp",
    version = "*",                 -- use a tagged release (ships prebuilt fuzzy binary)
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> navigate, <C-space> menu
      appearance = { nerd_font_variant = "mono" },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      signature = { enabled = true },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}

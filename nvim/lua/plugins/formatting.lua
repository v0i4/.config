-- Format-on-save with `mix format`, honoring the project's .formatter.exs.
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        heex = { "mix" },
        eex = { "mix" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 5000,        -- mix format can be slow on first run
        lsp_format = "fallback",
      },
    },
  },
}

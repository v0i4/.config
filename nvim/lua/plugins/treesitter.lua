-- Syntax highlighting & indentation. Elixir/Phoenix needs elixir + heex + eex grammars.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "elixir", "heex", "eex", "erlang",
        "lua", "vim", "vimdoc", "bash", "html", "json", "markdown",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

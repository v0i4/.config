-- Active theme is set at the bottom (last config() to run wins). The others
-- install onto the runtimepath so `:colorscheme <name>` works immediately
-- without needing a restart or `:Lazy load`.
return {
  -- fluoromachine.nvim: single colorscheme name, 3 internal flavors picked by
  -- the `theme` field below (fluoromachine | retrowave | delta). Change the
  -- field and re-run `:colorscheme fluoromachine` to switch flavor.
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 900,
    config = function()
      require("fluoromachine").setup({
        glow = true,
        theme = "retrowave",
      })
    end,
  },

  {
    "lunarvim/synthwave84.nvim",
    lazy = false,
    priority = 900,
  },

  -- Non-glow port of the same VS Code theme, different color balance.
  -- Ships two names: "synthweave" and "synthweave-transparent".
  {
    "samharju/synthweave.nvim",
    lazy = false,
    priority = 1000, -- loads last: this is the active default
    config = function()
      vim.cmd.colorscheme("synthweave")
    end,
  },
}

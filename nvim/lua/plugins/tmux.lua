-- Seamless pane navigation/resize across nvim splits and tmux panes.
-- Supersedes the plain <C-h/j/k/l> window-nav maps in config/keymaps.lua:
-- those only moved between nvim splits, these fall through to tmux panes too.
return {
  {
    "aserowy/tmux.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("tmux").setup({
        navigation = { enable_default_keybindings = true }, -- <C-h/j/k/l>
        resize = { enable_default_keybindings = true }, -- <C-Up/Down/Left/Right>
        -- clipboard already handled by opt.clipboard = "unnamedplus"; avoid
        -- a second, competing sync path.
        copy_sync = { enable = false },
      })
    end,
  },
}

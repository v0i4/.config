-- Fast file finder + grep (Rust-backed). Replaces ripgrep-dependent telescope
-- live_grep — fff ships its own binary, so no external `rg` is required.
return {
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      -- Downloads a prebuilt binary, falling back to `cargo build`.
      require("fff.download").download_or_build_binary()
    end,
    opts = {},
    -- Loaded on first keypress; the keys below own the find/grep binds.
    keys = {
      { "<leader>ff", function() require("fff").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("fff").live_grep() end,  desc = "Live grep" },
    },
  },
}

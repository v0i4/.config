-- Fuzzy finder: find files, live grep, buffers. Answers "how to find a file in project".
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- find_files / live_grep are owned by fff.nvim (see plugins/fff.lua)
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent files" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "_build", "deps", "node_modules", "%.beam" },
      },
    },
  },
}

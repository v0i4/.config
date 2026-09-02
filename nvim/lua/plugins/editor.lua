-- Quality-of-life editing plugins.
return {
  -- Auto close/rename HTML & HEEx tags.
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Git signs in the gutter + blame.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = false, -- toggle with <leader>gb
      current_line_blame_opts = { delay = 300 },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      -- synthwave84 makes NonText (gitsigns' default blame link) match the
      -- background exactly, so the blame toggle "worked" but was invisible.
      local function fix_blame_hl()
        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
      end
      fix_blame_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = fix_blame_hl })
    end,
    keys = {
      {
        "<leader>gb",
        function() require("gitsigns").toggle_current_line_blame() end,
        desc = "Git: toggle line blame",
      },
      {
        "<leader>gB",
        function() require("gitsigns").blame() end,
        desc = "Git: full buffer blame",
      },
    },
  },

  -- Auto-insert matching pairs; integrates with blink.cmp via default behavior.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- gcc / gc to comment.
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}

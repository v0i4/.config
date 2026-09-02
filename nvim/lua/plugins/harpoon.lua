-- Quick-jump between a handful of pinned files. Answers "get me back to that
-- file I was just in" without going through the fuzzy finder.
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = function()
      local harpoon = require("harpoon")
      local keys = {
        { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon: add file" },
        {
          "<leader>hh",
          function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
          desc = "Harpoon: quick menu",
        },
        { "<leader>hp", function() harpoon:list():prev() end, desc = "Harpoon: prev" },
        { "<leader>hn", function() harpoon:list():next() end, desc = "Harpoon: next" },
      }
      for i = 1, 4 do
        table.insert(keys, {
          "<leader>" .. i,
          function() harpoon:list():select(i) end,
          desc = "Harpoon: jump to " .. i,
        })
      end
      return keys
    end,
  },
}

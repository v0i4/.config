-- Entry point. Loads core config then bootstraps lazy.nvim (which imports lua/plugins/*).
require("config.options")
require("config.keymaps")
require("config.lazy")

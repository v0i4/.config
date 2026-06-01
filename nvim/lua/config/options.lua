-- Set leader BEFORE plugins load so mappings register correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"        -- avoid layout shift when diagnostics appear
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8

-- Indentation: Elixir/Phoenix convention is 2 spaces.
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Files / undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.termguicolors = true      -- 24-bit color (required by most themes/treesitter)
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.clipboard = "unnamedplus" -- share with system clipboard

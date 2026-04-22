-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- LazyVim already sets: relativenumber, number, cursorline, termguicolors,
-- signcolumn, smartcase, ignorecase, splitright, splitbelow, mouse, clipboard, etc.

-- Your custom overrides
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false
opt.hlsearch = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.updatetime = 50
opt.timeoutlen = 200
opt.ttimeoutlen = 0
opt.equalalways = false
opt.iskeyword:append("-")
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

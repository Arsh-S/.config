local opt = vim.opt -- for conciceness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Key repeat settings for motion keys
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 0

-- Allow key repeat (important for motion keys like hjkl)
vim.cmd([[set keymodel=]])

-- Mouse support
opt.mouse = "a"

-- Better completion
opt.completeopt = { "menuone", "noselect" }

-- Better search
opt.hlsearch = false
opt.incsearch = true

-- Scroll settings
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Better experience
opt.updatetime = 50


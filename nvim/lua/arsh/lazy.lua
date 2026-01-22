local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumblend = 10 -- optional transparency

-- Fix cmp popup highlights for Gruvbox
vim.cmd([[
  highlight! CmpItemAbbr guifg=#ebdbb2
  highlight! CmpItemAbbrMatch guifg=#fabd2f gui=bold
  highlight! CmpItemAbbrMatchFuzzy guifg=#fabd2f gui=bold
  highlight! CmpItemKind guifg=#8ec07c
  highlight! CmpItemMenu guifg=#928374
]])

-- Setup lazy.nvim
require("lazy").setup("arsh.plugins", {
  rocks = {
    enabled = false,
  },
})

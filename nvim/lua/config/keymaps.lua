-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- New line without insert
keymap("n", "<leader>j", "o<Esc>", { desc = "Add line below without insert" })
keymap("n", "<leader>k", "O<Esc>", { desc = "Add line above without insert" })

-- Format buffer (LazyVim uses <leader>cf by default, adding your alias)
keymap("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Rename file
keymap("n", "<leader>rf", function()
  local old = vim.fn.expand("%")
  vim.ui.input({ prompt = "Rename file to: ", default = old }, function(new)
    if new and #new > 0 and new ~= old then
      vim.cmd("saveas " .. new)
      vim.cmd("silent !rm " .. old)
      vim.cmd("bdelete " .. old)
    end
  end)
end, { desc = "Rename file" })

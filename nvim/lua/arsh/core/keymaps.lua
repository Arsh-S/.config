vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { noremap = true, silent = true })

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- new line without insert
vim.keymap.set("n", "<leader>j", "o<Esc>", { desc = "Add line below without insert" })
vim.keymap.set("n", "<leader>k", "O<Esc>", { desc = "Add line above without insert" })

-- Test leader key (removed to avoid conflict with nvim-tree keymaps)
-- keymap("n", "<leader>e", function()
-- 	print("Leader mapping works!")
-- end, opts)

-- -- Fast escape using 'kj'
-- keymap("i", "kj", "<Esc>", opts)
-- keymap("v", "kj", "<Esc>", opts)
-- keymap("c", "kj", "<C-C>", opts)

-- Telescope keymaps
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Bufferline
keymap("n", "]b", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", noremap = true, silent = true })
keymap("n", "[b", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", noremap = true, silent = true })
keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer", noremap = true, silent = true })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close current buffer", noremap = true, silent = true })
keymap("n", "<leader>[", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer", noremap = true, silent = true })
keymap("n", "<leader>]", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer", noremap = true, silent = true })

-- LSP
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

-- Definitions
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)

-- Code actions and rename
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "<leader>rf", function()
	local old = vim.fn.expand("%")
	vim.ui.input({ prompt = "Rename file to: ", default = old }, function(new)
		if new and #new > 0 and new ~= old then
			vim.cmd("saveas " .. new)
			vim.cmd("silent !rm " .. old)
			vim.cmd("bdelete " .. old)
		end
	end)
end, opts)

-- Diagnostics
keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

-- Format current buffer with conform.nvim
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

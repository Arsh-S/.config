return {
	"nvimdev/lspsaga.nvim",
	lazy = false, -- force load for now; switch to event="LspAttach" after it works
	config = function()
		local ok, saga = pcall(require, "lspsaga")
		if not ok then
			vim.notify("lspsaga failed to load: " .. tostring(saga), vim.log.levels.ERROR)
			return
		end
		saga.setup({
			ui = { border = "rounded", title = true },
			symbol_in_winbar = { enable = false },
			lightbulb = { enable = true, enable_in_insert = false },
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

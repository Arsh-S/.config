-- lua/arsh/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"json",
			"python",
			"markdown",
			"markdown_inline",
		},
		highlight = {
			enable = false,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = false },

		-- Enable TS playground to inspect highlight groups
		playground = {
			enable = true,
			updatetime = 25,
			persist_queries = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
	end,
}

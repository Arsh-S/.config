-- lua/arsh/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua", "vim", "vimdoc", "query",
			"javascript", "typescript", "tsx", "jsdoc",
			"html", "css", "scss",
			"json", "jsonc", "yaml", "toml",
			"python", "rust", "go", "gomod", "gosum",
			"c", "cpp", "java", "c_sharp",
			"ruby", "php", "zig",
			"bash", "fish",
			"sql",
			"markdown", "markdown_inline",
			"regex", "diff", "gitcommit", "git_rebase",
			"dockerfile", "terraform",
			"svelte", "vue",
			"graphql", "proto",
			"make", "cmake",
			"xml",
		},
		highlight = {
			enable = true,
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
		require("nvim-treesitter.configs").setup(opts)
	end,
}

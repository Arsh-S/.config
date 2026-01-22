return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Lua
					"lua_ls",
					-- Python
					"pyright",
					-- JavaScript/TypeScript
					"ts_ls",
					-- C/C++
					"clangd",
					-- Rust
					"rust_analyzer",
					-- Go
					"gopls",
					-- Java
					"jdtls",
					-- C#
					"omnisharp",
					-- Ruby
					"solargraph",
					-- PHP
					"intelephense",
					-- Bash/Shell
					"bashls",
					-- HTML
					"html",
					-- CSS
					"cssls",
					-- Tailwind
					"tailwindcss",
					-- JSON
					"jsonls",
					-- YAML
					"yamlls",
					-- Markdown
					"marksman",
					-- Docker
					"dockerls",
					-- SQL
					"sqlls",
					-- Zig
					"zls",
					-- Svelte
					"svelte",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim" },
		config = function()
			local servers = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"gopls",
				"jdtls",
				"omnisharp",
				"solargraph",
				"intelephense",
				"bashls",
				"html",
				"cssls",
				"tailwindcss",
				"jsonls",
				"yamlls",
				"marksman",
				"dockerls",
				"sqlls",
				"zls",
				"svelte",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {})
				vim.lsp.enable(server)
			end
		end,
	},
}

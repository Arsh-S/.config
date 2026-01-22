return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme kanagawa-wave")

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Defer to ensure it applies last
				vim.defer_fn(function()
					local hl = vim.api.nvim_set_hl
					local ns = 0
					local links = {
						["@keyword"] = "Keyword",
						["@keyword.return"] = "Keyword",
						["@keyword.function"] = "Keyword",
						["@function"] = "Function",
						["@function.call"] = "Function",
						["@variable"] = "Identifier",
						["@variable.parameter"] = "Identifier",
						["@constant"] = "Constant",
						["@string"] = "String",
						["@comment"] = "Comment",
						["@number"] = "Number",
						["@operator"] = "Operator",
						["@type"] = "Type",
						["@field"] = "Identifier",
						["@spell"] = "None",
					}

					for from, to in pairs(links) do
						hl(ns, from, { link = to, priority = 300 }) -- raise priority
					end
				end, 50) -- defer 50ms
			end,
		})
	end,
}

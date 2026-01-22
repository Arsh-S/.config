return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        markdown = { "prettier" },
      },
      -- format_on_save disabled - use <leader>fm to format manually
      format_on_save = false,
    },
  },
}

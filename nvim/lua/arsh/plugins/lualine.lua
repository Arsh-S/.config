return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = { { "filename", path = 2 } },
        lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
      },
      options = {
        theme = "gruvbox",
      },
    })
  end,
}

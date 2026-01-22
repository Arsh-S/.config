return {
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Auto tag for HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

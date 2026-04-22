return {
  -- Add all your language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        pyright = {},
        ts_ls = {},
        clangd = {},
        rust_analyzer = {},
        gopls = {},
        jdtls = {},
        omnisharp = {},
        solargraph = {},
        intelephense = {},
        bashls = {},
        html = {},
        cssls = {},
        tailwindcss = {},
        jsonls = {},
        yamlls = {},
        marksman = {},
        dockerls = {},
        sqlls = {},
        zls = {},
        svelte = {},
      },
    },
  },

  -- Mason ensure installed tools
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "black",
        "eslint_d",
        "jsonlint",
        "luacheck",
        "pylint",
        "shellcheck",
        "shfmt",
      },
    },
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        python = { "pylint" },
      },
    },
  },
}

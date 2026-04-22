return {
  -- Treesitter extra parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "tsx", "jsdoc",
        "html", "css", "scss", "json", "jsonc", "yaml", "toml",
        "python", "rust", "go", "gomod", "gosum",
        "c", "cpp", "java", "c_sharp", "ruby", "php", "zig",
        "bash", "fish", "sql",
        "markdown", "markdown_inline", "regex",
        "diff", "gitcommit", "git_rebase",
        "dockerfile", "terraform", "svelte", "vue",
        "graphql", "proto", "make", "cmake", "xml",
      },
    },
  },

  -- Tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate right" },
    },
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle terminal" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then return 15 end
        if term.direction == "vertical" then return vim.o.columns * 0.4 end
      end,
      direction = "float",
      float_opts = { border = "curved" },
    },
  },
}

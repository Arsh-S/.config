return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = {
          accept = "<M-l>",
          accept_word = "<M-k>",
          accept_line = "<M-j>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
    keys = {
      {
        "<M-\\>",
        function()
          require("copilot.suggestion").next()
        end,
        mode = "i",
        desc = "Copilot: request suggestion",
      },
    },
  },

  -- Completion menu: Tab to accept, Ctrl-n/Ctrl-p to navigate
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
    },
  },

  -- Autoclose tags
  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" },
    },
  },
}

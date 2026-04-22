return {
  -- Accelerated j/k
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "BufReadPost",
    config = function()
      require("accelerated-jk").setup({
        mode = "time_driven",
        enable_deceleration = false,
        acceleration_motions = {},
        acceleration_limit = 150,
        acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
        deceleration_table = { { 150, 9999 } },
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { buffer = true })
          vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { buffer = true })
        end,
      })
    end,
  },

  -- Scroll acceleration
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    opts = {
      easing = "quadratic",
      duration_multiplier = 0.6,
    },
  },

  -- Smear cursor
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      smear_insert_mode = true,
    },
  },

  -- Vim surround (tpope's — LazyVim uses mini.surround by default)
  { "nvim-mini/mini.surround", enabled = false },
  { "tpope/vim-surround" },

  -- ReplaceWithRegister
  { "vim-scripts/ReplaceWithRegister" },

  -- Undotree
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
  },

  -- Snacks: show hidden + gitignored files in explorer and picker
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
        doc = { inline = true, float = true },
      },
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },

  -- Oil file browser
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },

  -- Which-key helix preset
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Add to Harpoon" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },
}

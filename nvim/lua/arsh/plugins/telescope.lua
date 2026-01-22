return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          vertical = {
            mirror = false,
            prompt_position = "bottom",
            preview_cutoff = 1,
            width = 0.9,
            height = 0.95,
          },
        },
        file_ignore_patterns = {}, -- Show gitignored files
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true, -- Don't respect .gitignore
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
  end,
}

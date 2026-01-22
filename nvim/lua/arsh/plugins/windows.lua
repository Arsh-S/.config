return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    -- Recommended window options for proper resizing behavior
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false

    require("windows").setup({
      animation = {
        enable = true,
        duration = 150, -- milliseconds
        fps = 60,
        easing = "in_out_sine", -- options: linear, in_sine, out_sine, in_out_sine
      },
    })
  end,
}

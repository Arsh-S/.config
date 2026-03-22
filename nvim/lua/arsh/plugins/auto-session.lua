return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
    post_restore_cmds = {
      function()
        vim.schedule(function()
          require("nvim-tree.api").tree.open()
        end)
      end,
    },
  },
}

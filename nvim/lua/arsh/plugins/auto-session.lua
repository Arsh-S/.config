return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
    post_restore_cmds = {
      function()
        local bufs = vim.tbl_filter(function(b)
          return vim.bo[b].buflisted and vim.bo[b].buftype == ""
        end, vim.api.nvim_list_bufs())
        if #bufs == 0 then
          vim.cmd("enew")
          vim.schedule(function()
            require("nvim-tree.api").tree.open()
          end)
        end
      end,
    },
  },
}

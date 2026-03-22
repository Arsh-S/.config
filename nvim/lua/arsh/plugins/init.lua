return {
  -- Load all plugin files
  require("arsh.plugins.colorscheme"),
  require("arsh.plugins.lsp"),
  require("arsh.plugins.telescope"),
  require("arsh.plugins.treesitter"),
  require("arsh.plugins.cmp"),
  require("arsh.plugins.nvim-tree"),
  require("arsh.plugins.lualine"),
  require("arsh.plugins.gitsigns"),
  require("arsh.plugins.lazygit"),
  require("arsh.plugins.comment"),
  require("arsh.plugins.autoclose"),
  require("arsh.plugins.tmux-navigator"),
  require("arsh.plugins.formatting"),
  require("arsh.plugins.linting"),
  require("arsh.plugins.nvim-web-devicons"),
  require("arsh.plugins.plenary"),
  require("arsh.plugins.treesitterplayground"),
  require("arsh.plugins.surround"),
  require("arsh.plugins.replacewithregister"),
  require("arsh.plugins.bufferline"),
  require("arsh.plugins.smear-cursor"),

  -- Movement & Editing
  require("arsh.plugins.flash"),
  require("arsh.plugins.mini-ai"),
  require("arsh.plugins.undotree"),

  -- Visual & UI
  require("arsh.plugins.noice"),
  require("arsh.plugins.indent-blankline"),
  require("arsh.plugins.dressing"),
  require("arsh.plugins.todo-comments"),
  require("arsh.plugins.which-key"),

  -- Productivity
  require("arsh.plugins.harpoon"),
  require("arsh.plugins.trouble"),
  require("arsh.plugins.oil"),
  require("arsh.plugins.toggleterm"),

  -- Git
  require("arsh.plugins.diffview"),

  -- Coding
  require("arsh.plugins.copilot"),
  require("arsh.plugins.dap"),
}

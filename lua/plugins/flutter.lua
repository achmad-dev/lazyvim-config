return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      ui = {
        border = "rounded",
      },
    },
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {},
      },
    },
  },
}

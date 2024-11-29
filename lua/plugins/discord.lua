return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {
    text = {
      viewing = "Viewing a multi-thread-pattern project",
      editing = "Editing a multi-thread-pattern project",
      file_browser = "Browsing file in multi-thread-pattern project",
      lsp_manager = "Configuring LSP in multi-thread-pattern project",
      vcs = "Comitting changes in multi-thread-pattern project",
      workspace = "In relearn project",
    },
  }, -- calls require('cord').setup()
}

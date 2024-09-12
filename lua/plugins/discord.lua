return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {
    text = {
      viewing = "Viewing a secret project",
      editing = "Editing a secret project",
      file_browser = "Browsing file in secret project",
      lsp_manager = "Configuring LSP in secret project",
      vcs = "Comitting changes in secret project",
      workspace = "In secret project",
    },
  }, -- calls require('cord').setup()
}

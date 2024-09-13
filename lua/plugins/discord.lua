return {
  "vyfor/cord.nvim",
  build = "./build || .\\build",
  event = "VeryLazy",
  opts = {
    text = {
      viewing = "Viewing a nnfs_java project",
      editing = "Editing a nnfs_java project",
      file_browser = "Browsing file in nnfs_java project",
      lsp_manager = "Configuring LSP in secret project",
      vcs = "Comitting changes in secret project",
      workspace = "In secret project",
    },
  }, -- calls require('cord').setup()
}

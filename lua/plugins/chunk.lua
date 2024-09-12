return {

  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = "#957FB8",
      },
      indent = {
        enable = true,
      },
    })
  end,
}

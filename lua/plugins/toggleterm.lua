return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      -- Map Ctrl+T to toggle the terminal
      vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<CR>", { silent = true })
      vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:ToggleTerm<CR>", { silent = true })
    end,
  },
}

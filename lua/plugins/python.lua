return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ninja", "rst" } },
  },
  {
    "williamboman/mason.nvim",
     opts = { ensure_installed = { "debugpy" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              function() require("lazyvim.util").lsp.organize_imports() end,
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function() require("lazyvim.util").lsp.organize_imports() end,
              desc = "Organize Imports",
            },
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = { "pyright", "ruff", "ruff_lsp" }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = true -- Enable all the listed LSP servers
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    -- stylua: ignore
    keys = {
      { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
      { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
    },
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      if vim.fn.has("win32") == 1 then
        require("dap-python").setup(path .. "/venv/Scripts/python")
      else
        require("dap-python").setup(path .. "/venv/bin/python")
      end
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function()
      require("venv-selector").setup({
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
      })
    end,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = {
      handlers = {
        python = function() end,
      },
    },
  },
}
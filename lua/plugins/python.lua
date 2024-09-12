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
              function()
                require("lazyvim.util").lsp.organize_imports()
              end,
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                require("lazyvim.util").lsp.organize_imports()
              end,
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

      -- Configure pyright specifically
      opts.servers.pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace", -- Use "workspace" for full project diagnostics
            },
          },
        },
      }
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
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Existing configuration
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")

      -- Setup sources for completion
      opts.sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        -- Add additional sources as needed
      }
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

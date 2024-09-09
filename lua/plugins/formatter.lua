return {
    {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "clang-format", "gofumpt", "ruff", "ocamlformat", "black", "isort" } },
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            -- Utilities for creating configurations
            local util = require "formatter.util"

            -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
            require("formatter").setup({
                -- Enable or disable logging
                logging = true,
                -- Set the log level
                log_level = vim.log.levels.DEBUG,
                -- All formatter configurations are opt-in
                filetype = {
                    lua = {
                        require("formatter.filetypes.lua").stylua,
                        function()
                            return {
                                exe = "stylua",
                                args = {
                                    "--column-width",
                                    "120",
                                    "--indent-type",
                                    "Spaces",
                                    "--indent-width",
                                    "2",
                                    "--search-parent-directories",
                                    "--stdin-filepath",
                                    util.escape_path(util.get_current_buffer_file_path()),
                                    "--",
                                    "-",
                                },
                                stdin = true,
                            }
                        end
                    },
                    java = {
                        function()
                            return {
                                -- Need to install clang-format first
                                exe = "clang-format",  -- Use clang-format for Java formatter
                                args = {
                                    "--style=file",
                                    "--assume-filename",
                                    util.escape_path(util.get_current_buffer_file_path()),
                                },
                                stdin = true,
                            }
                        end
                    },
                    go = {
                        function()
                            return {
                                exe = "gofumpt",  -- Use gofumpt for Go files
                                args = { "-s" },
                                stdin = true,
                            }
                        end
                    },
                    rust = {
                        function()
                            return {
                                exe = "ruff",  -- Use rustfmt for Rust files
                                args = { "--emit=stdout" },
                                stdin = true,
                            }
                        end
                    },
                    python = {
                        function()
                            return {
                                exe = "black",  -- Use black for Python files
                                args = { "-" },
                                stdin = true,
                            }
                        end,
                        function()
                            return {
                                exe = "isort",  -- Use isort for sorting imports in Python
                                args = { "--stdout", "--profile", "black", "-" },
                                stdin = true,
                            }
                        end,
                    },
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                        function()
                            vim.lsp.buf.format({ async = true })
                        end,
                    }
                }
            })
            local augroup = vim.api.nvim_create_augroup
            local autocmd = vim.api.nvim_create_autocmd

            augroup("__formatter__", { clear = true })
            autocmd("BufWritePre", {
            group = "__formatter__",
            callback = function()
                vim.cmd("FormatWrite")
            end,
            })
        end
    }
}
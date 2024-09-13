return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "clang-format", "gofumpt", "ruff", "ocamlformat", "black", "isort" } },
  },
   {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "eslint_d" },
        ["javascriptreact"] = { "eslint_d" },
        ["typescript"] = { "eslint_d" },
        ["typescriptreact"] = { "eslint_d" },
        ["python"] = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_fix", "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        ["go"] = { "gofumpt" },
        ["rust"] = { "rustfmt" },
        ["java"] = { "clang_format" },
        ["ocaml"] = { "ocamlformat" },
        ["sh"] = { "shfmt" },
        ["c"] = { "uncrustify" },
        ["cpp"] = { "uncrustify" },
        ["xml"] = { "xmllint" },
        ["*"] = { "uncrustify" },
      },
      formatters = {
        eslint_d = {
          condition = function(_self, ctx)
            local package_json = vim.fs.find({ "package.json" }, { path = ctx.filename, upward = true })[1]
            if package_json then
              local f = io.open(package_json, "r")
              if f then
                local data = vim.json.decode(f:read("*all"))
                f:close()
                if data and data.eslintConfig then
                  return true
                end
              end
            end
            return vim.fs.find({ ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" }, {
              path = ctx.filename,
              upward = true,
            })[1]
          end,
        },
        dprint = {
          condition = function(_, ctx)
            return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}

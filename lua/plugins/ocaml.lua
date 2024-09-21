return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ocaml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          get_language_id = function(_, ftype)
            filetypes = {
              "ocaml",
              "reason",
              "ocaml.interface",
              "ocaml.ocamllex",
              "ocaml.ocamlyacc",
              "ocaml.menhir",
              "dune",
            }
            return vim.tbl_contains(filetypes, ftype) and "ocaml" or nil
          end,
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "*.opam",
              "esy.json",
              "package.json",
              ".git",
              "dune-project",
              "dune-workspace",
              "*.ml"
            )(fname)
          end,
        },
      },
    },
  },
}


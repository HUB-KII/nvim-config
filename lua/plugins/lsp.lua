return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shellcheck",
        "shfmt",

        -- Web development
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettier",
        "emmet-language-server",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        ts_ls = {},
        tailwindcss = {},
        eslint = {},
        emmet_language_server = {},
      },
    },
  },
}

return {
  -- Automated LSP, Linter, and Formatter background installer (UPDATED PATH)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Ensure opts.ensure_installed exists as an array
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },
}

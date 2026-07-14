return {
  -- Incremental LSP renaming with live command previews
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Link it to LazyVim's default code rename shortcut
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>cr",
              function()
                local inc_rename = require("inc_rename")
                return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
              end,
              expr = true,
              desc = "Incremental Rename",
              has = "rename",
            },
          },
        },
      },
    },
  },
}

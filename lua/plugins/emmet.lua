return {
  {
    "olrtg/nvim-emmet",
    ft = {
      "html",
      "css",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    },
    config = function()
      vim.keymap.set("i", "<C-e>", "<cmd>Emmet<CR>", { desc = "Emmet Expand" })
    end,
  },
}

return {
  -- 1. Turn off Neo-Tree completely
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- 2. Activate the floating mini.files grid browser
  {
    "nvim-mini/mini.files",
    opts = {
      windows = { preview = true, width_focus = 30, width_preview = 30 },
      options = { use_as_default = true },
    },
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (current directory)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (project root)",
      },
    },
  },

  -- 3. Disable flash.nvim completely
  {
    "folke/flash.nvim",
    enabled = false,
  },
}

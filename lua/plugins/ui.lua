return {
  -- 1. Noice Configuration: Add borders & Suppress "No information available"
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Enable documentation borders
      opts.presets.lsp_doc_border = true

      -- Initialize routes table if it doesn't exist
      opts.routes = opts.routes or {}

      -- Catch and skip the "No information available" notification popup
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },

  -- 2. Keep notification boxes on screen for 10 seconds
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },

  -- 3. Configure Bufferline to devaslife's minimal text tab settings
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- 4. Sync the bottom status line theme with Solarized
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },

  -- 5. Add devaslife's custom floating window tags (Incline)
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local has_colors, solarized = pcall(require, "solarized-osaka.colors")
      local colors = has_colors and solarized.setup() or {}

      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500 or "#d33682", guifg = colors.base04 or "#839496" },
            InclineNormalNC = { guifg = colors.violet500 or "#6c71c4", guibg = colors.base03 or "#002b36" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local has_devicons, devicons = pcall(require, "nvim-web-devicons")
          local icon, color = "", nil
          if has_devicons then
            icon, color = devicons.get_icon_color(filename)
          end

          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- 6. Animations configuration: Keep window animations but DISABLE scroll loops
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
}

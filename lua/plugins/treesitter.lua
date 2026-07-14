return {
  -- High-fidelity syntax parsing and custom language assignments
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure opts.ensure_installed exists as a table
      opts.ensure_installed = opts.ensure_installed or {}

      -- Seamlessly append your target languages to LazyVim's default array
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svelte",
      })

      -- Register and force MDX files to parse with Markdown styling
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })

      -- Modern safe fallback API call to associate MDX text parsing
      pcall(vim.treesitter.language.register, "markdown", "mdx")
    end,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      ---@diagnostic disable-next-line: missing-fields (Type requires all config properties)
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = {
          enable = true,
        },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "jsonc",
          "javascript",
          "jsdoc",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "scss",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "luadoc",
          "vim",
          "vimdoc",
          "dockerfile",
          "gitignore",
          "query", -- This is the Treesitter query lang
          "regex",
          "toml",
          "zig",
          "rust",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      })

      -- No mdx treesitter grammar available
      ---@see https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/
      ---@see https://www.in2deep.xyz/posts/astro-development-using-nvim/

      vim.filetype.add({
        extension = {
          mdx = "markdown.mdx",
        },
      })
    end,
  },
}

return {
  -- Handles formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          ["markdown.mdx"] = { "prettierd" },
          svelte = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = function()
          if vim.g.format_on_save then
            return {
              lsp_fallback = true,
              async = false,
              timeout_ms = 1000,
            }
          else
            return nil
          end
        end,
      })
    end,
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        mode = { "n", "v" },
        desc = "Format file or range",
      },
    },
  },
}

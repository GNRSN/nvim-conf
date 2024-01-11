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

      -- LATER: Allow setting to false per repo via e.g. nvimconf
      vim.g.format_on_save = true

      -- Add commands to enable/disable format on save
      vim.api.nvim_create_user_command("FormatOnSaveEnable", function()
        vim.g.format_on_save = true
      end, {
        desc = "Enable format-on-save",
      })
      vim.api.nvim_create_user_command("FormatOnSaveDisable", function()
        vim.g.format_on_save = false
      end, {
        desc = "Disable format-on-save",
      })
      vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
        vim.g.format_on_save = not vim.g.format_on_save
      end, {
        desc = "Toggle format-on-save",
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

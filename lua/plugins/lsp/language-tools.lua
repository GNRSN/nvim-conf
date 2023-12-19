local function trigger_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      --  only use null-ls for formatting instead of lsp server
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
    -- REVIEW: Documentation says to pass async = false here as property when doing formatting on save
  })
end

return {
  -- None-ls is a null_ls replacement,
  -- handles all language tooling that is not part of LSP, i.e. formatters and linters
  -- Pro
  -- - Project recognition built in, supports monorepo for e.g. eslint, this required a "hack" with nvim-lint
  -- Con:
  -- - All listed code actions are by "null_ls" instead of per tooling
  ---@type LazySpec
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      -- NOTE: even with cpell.nvim, spellchecking isn't as good as with the official vscode extension.
      -- It seems to be bundled with dictionaries or does some language based magic?
      -- @see https://github.com/davidmh/cspell.nvim/issues/14
      -- TODO: See if possible to add dictionaries
      "davidmh/cspell.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cf",
        function()
          vim.lsp.buf.format()
        end,
        mode = { "n", "v" },
        desc = "Format file or range",
      },
    },
    config = function()
      -- Custom variable to keep track of format on save
      vim.g.format_on_save = true

      local cspell = require("cspell")
      local mason_null_ls = require("mason-null-ls")
      local null_ls = require("null-ls")
      local null_ls_utils = require("null-ls.utils")

      mason_null_ls.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "black", -- python formatter
          "pylint", -- python linter
          "eslint_d", -- js linter
        },
        automatic_installation = true,
      })

      -- for conciseness
      local formatting = null_ls.builtins.formatting -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- to setup format on save
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      -- configure null_ls
      null_ls.setup({
        -- add package.json as identifier for root (for typescript monorepos)
        root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
        -- setup formatters & linters
        sources = {
          --  to disable file types use
          --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
          formatting.prettier.with({
            extra_filetypes = { "svelte" },
          }), -- js/ts formatter
          formatting.stylua, -- lua formatter
          formatting.isort,
          formatting.black,
          diagnostics.pylint,
          diagnostics.eslint_d.with({ -- js/ts linter
            -- only enable if project has eslint config
            condition = function(utils)
              return utils.root_has_file({
                ".eslintrc.js",
                ".eslintrc.cjs",
                "eslint.config.js",
                "eslint.config.cjs",
                "eslint.config.mjs",
                -- REVIEW: It's possible to define eslint config in package json so needs to check that,
                -- effectivly making this check semi useless
                "package.json",
              })
            end,
          }),
          cspell.diagnostics.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity["HINT"]
            end,
          }),
          cspell.code_actions,
        },
        -- configure format on save
        on_attach = function(current_client, bufnr)
          if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                if vim.g.format_on_save then
                  trigger_formatting(bufnr)
                end
              end,
            })
          end
        end,
      })

      -- Create commands for restarting eslint
      vim.api.nvim_create_user_command("EslintRestartFlatConfig", function()
        os.execute("ESLINT_USE_FLAT_CONFIG=true eslint_d restart")
      end, {
        desc = "Restart eslint_d with flat config enabled",
      })
      vim.api.nvim_create_user_command("EslintRestartLegacyConfig", function()
        os.execute("ESLINT_USE_FLAT_CONFIG= eslint_d restart")
      end, {
        desc = "Restart eslint_d without flat config, supporting the eslintrc format instead",
      })
      -- TODO: This doesn't work after restarting eslint_d, it gets rid of the message for mismatching config but new errors aren't visible
      -- REVIEW: `:e aka :edit` reloads the file, works as replacement
      vim.api.nvim_create_user_command("EslintRefresh", function()
        require("null-ls").enable({
          name = "eslint_d",
        })
      end, {
        desc = "Trigger a refresh of eslint",
      })

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
  },
}

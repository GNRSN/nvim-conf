local get_cwd = function(bufNr)
  local active_ft = vim.bo.filetype
  local active_linters = require("lint").linters_by_ft[active_ft]

  -- REVIEW: Its a bit silly that we check the exact index here but I'm still a lua n00b
  if active_linters and active_linters[1] then
    local active_linter_1 = active_linters[1]

    if active_linter_1 == "eslint_d" then
      local active_buffer = vim.api.nvim_buf_get_name(bufNr)
      local project_root = require("lspconfig.util").find_package_json_ancestor(active_buffer)
      return project_root
    end
  end
  return nil
end

return {
  -- Asyncrnoys lint runner
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cl",
        function()
          require("lint").try_lint(nil, { cwd = get_cwd(0) })
        end,
        desc = "Trigger linting for current file",
      },
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint_d", "cspell" },
        typescript = { "eslint_d", "cspell" },
        javascriptreact = { "eslint_d", "cspell" },
        typescriptreact = { "eslint_d", "cspell" },
        svelte = { "eslint_d", "cspell" },
        python = { "pylint", "cspell" },
      }

      -- lint.linters.eslint_d.env = {
      --   ["ESLINT_USE_FLAT_CONFIG"] = "true",
      -- }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function(ev)
          lint.try_lint(nil, { cwd = get_cwd(ev.buf) })
        end,
      })


      vim.api.nvim_create_user_command("EslintRestartFlat", function()
        os.execute("ESLINT_USE_FLAT_CONFIG=true eslint_d restart")
      end, {
        desc = "Restart eslint_d with flat config enabled",
      })
      vim.api.nvim_create_user_command("EslintRestartLegacy", function()
        os.execute("ESLINT_USE_FLAT_CONFIG= eslint_d restart")
      end, {
        desc = "Restart eslint_d without flat config, supporting the eslintrc format instead",
      })
    end,
  },
}

local get_cwd = function(bufNr)
  local active_buffer = vim.api.nvim_buf_get_name(bufNr)
  -- local project_root = require("lspconfig.util").root_pattern("package.json")(active_buffer)
  local project_root = require("lspconfig.util").find_package_json_ancestor(active_buffer)
  return project_root
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
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "pylint" },
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
    end,
  },
}

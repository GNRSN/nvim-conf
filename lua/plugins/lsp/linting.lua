local get_cwd = function()
  local active_buffer = vim.api.nvim_buf_get_name(0)
  local project_root = require("lspconfig.util").root_pattern("package.json")(active_buffer)
  if project_root then
    print("project root: " .. project_root)
  end
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
          local lint = require("lint")
          lint.linters.eslint_d.cwd = get_cwd()
          lint.try_lint()
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
        callback = function(event)
          -- print(vim.inspect(event))
          lint.linters.eslint_d.cwd = get_cwd()
          lint.try_lint()
        end,
      })
    end,
  },
}

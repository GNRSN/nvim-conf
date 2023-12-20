-- Custom lsp segment built on lsp-progress
local lsp_segment = {
  function()
    return require("lsp-progress").progress({
      max_size = 80,
      format = function(messages)
        local active_clients = vim.lsp.get_active_clients()
        if #messages > 0 then
          return table.concat(messages, " ")
        end
        local client_names = {}
        for _, client in ipairs(active_clients) do
          if client and client.name ~= "" then
            table.insert(client_names, 1, client.name)
          end
        end
        return table.concat(client_names, " ")
      end,
    })
  end,
  -- REVIEW: Don't need icon when we're writing out the names of servers?
  -- Setting icon "" didn't remove the space it occupies though
  icon = { "", align = "right" },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "kyazdani42/nvim-web-devicons",
      {
        "linrongbin16/lsp-progress.nvim",
        config = true,
      },
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = require("colorscheme.status-line"),
          component_separators = "|",
          section_separators = "",
          disabled_filetypes = {
            statusline = {
              "neo-tree",
            },
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = {
            -- TODO: Disable segment for now because it errors + maybe I don't want/need it
            --
            -- lsp_segment,
            "diagnostics",
          },
          lualine_y = { "filetype" },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {
            -- lsp_segment,
            "diagnostics",
          },
          lualine_y = { "filetype" },
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })

      -- listen lsp-progress event and refresh lualine
      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
      })
    end,
  },
}

return {
  -- Noice is multiple things, but foremost its an event/message router,
  -- it allows filtering/mapping messages to different UIs,
  -- hence an overlap/conflict with any UI plugin trying to do this in its own, e.g. nvim notify
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    ---@type LazySpec
    dependencies = {
      -- DOC: if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          render = "wrapped-compact",
          stages = "fade",
        },
      },
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- DOC: override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            -- TODO: Overlaps with cmp, this one has better highlighting through, but also overlaps the completion list
          },
        },
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        views = {
          notify = {},
          mini = {
            win_options = {
              winblend = 0,
            },
          },
        },
      })

      -- I use this to debug ui messages
      -- These are currenlty displayed in nvim-notify, not ideal
      -- LATER: Filter and show in some other UI?
      vim.api.nvim_create_user_command("TriggerSelect", function()
        vim.ui.select({ "foo", "bar" }, {}, function()
          print("result")
        end)
      end, {})
    end,
  },
}

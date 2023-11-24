return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        -- TODO: Consider raising log level for display, currently all info is shown, e.g. toggle hidden file in filetree
        render = "wrapped-compact",
        stages = "fade",
      })

      local log = require("plenary.log").new({
        plugin = "notify",
        level = "debug",
        use_console = false,
      })

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(msg, level, opts)
        log.info(msg, level, opts)
        if string.find(msg, "method .* is not supported") then
          return
        end

        require("notify")(msg, level, opts)
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>sn",
        function()
          -- REVIEW: Can we list notifications with some other layout?
          require("telescope").extensions.notify.notify()
        end,
        desc = "List notifications",
      },
    },
  },
}

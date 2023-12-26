local util = require("util")

return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    priority = 100,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-frecency.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      -- REVIEW: Trying out frecency plugin
      -- { "<leader><space>", "<Cmd>Telescope frecency workspace=CWD<CR>", desc = "Find Files (cwd)" },
      --
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sg", util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sG", util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader>sW", util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>uC",
        util.telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>fSs",
        util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>fSS",
        util.telescope("lsp_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
      {
        "<leader>fb",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Telescope file browser",
      },
    },
    opts = {
      defaults = {
        -- TODO: Also, icon isn't propagating
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<a-i>"] = function()
              util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              util.telescope("find_files", { hidden = true })()
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
            -- Shouldn't need normal mode in telescope so exit on first esc
            ["<esc>"] = function(...)
              -- TODO: No longer working, needs fixing
              return require("telescope.actions").close(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        frecency = {
          -- Validation prunes all entries for files which no longer exists,
          -- in combination with safe-mode this triggers a prompt after e.g. git switch if files differ
          -- which is anoying, better prune manually using :FrecencyValidate!
          auto_validate = false,
        },
      },
    },
    config = function(opts)
      require("telescope").setup(opts)

      -- _ = require("telescope").load_extension "dap"
      -- require("telescope").load_extension("notify")
      require("telescope").load_extension("file_browser")
      -- _ = require("telescope").load_extension "ui-select"
      require("telescope").load_extension("fzf")
      -- _ = require("telescope").load_extension "git_worktree"

      -- pcall(require("telescope").load_extension("smart_history"))
      -- LATER: Frecency breaks a couple of things when enabled
      -- - first time it is used to enter a buffer treesitter is dead in the buffer
      -- - needs to set git root manually, see https://github.com/nvim-telescope/telescope-frecency.nvim/issues/158
      --
      -- pcall(require("telescope").load_extension("frecency"))
      pcall(require("telescope").load_extension("noice"))
      pcall(require("telescope").load_extension("yank_history"))
    end,
  },
}

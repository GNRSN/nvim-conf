local Util = require("util")

return {
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    priority = 100,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- REVIEW: Added this but i'm not sure if I think it got better/worse?
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", Util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>F", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>uC",
        Util.telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>fSs",
        Util.telescope("lsp_document_symbols", {
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
        Util.telescope("lsp_workspace_symbols", {
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
    },
    opts = {
      defaults = {
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
              Util.telescope("find_files", { no_ignore = true })()
            end,
            ["<a-h>"] = function()
              Util.telescope("find_files", { hidden = true })()
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

        fzf_writer = {
          use_highlighter = false,
          minimum_grep_characters = 6,
        },

        hop = {
          -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
          keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

          -- Highlight groups to link to signs and lines; the below configuration refers to demo
          -- sign_hl typically only defines foreground to possibly be combined with line_hl
          sign_hl = { "WarningMsg", "Title" },

          -- optional, typically a table of two highlight groups that are alternated between
          line_hl = { "CursorLine", "Normal" },

          -- options specific to `hop_loop`
          -- true temporarily disables Telescope selection highlighting
          clear_selection_hl = false,
          -- highlight hopped to entry with telescope selection highlight
          -- note: mutually exclusive with `clear_selection_hl`
          trace_entry = true,
          -- jump to entry where hoop loop was started from
          reset_selection = true,
        },

        -- ["ui-select"] = {
        --   require("telescope.themes").get_dropdown {
        --     -- even more opts
        --   },
        -- },
      },
    },
  },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-hop.nvim",
  -- https://github.com/nvim-telescope/telescope-ui-select.nvim
  -- not sure if I want to keep
  "nvim-telescope/telescope-ui-select.nvim",
  {
    -- Clipboard manager, seems cool @see https://github.com/AckslD/nvim-neoclip.lua
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup()
    end,
  },
}

-- REVIEW: Maybe fzf isn't running without being loaded?

-- _ = require("telescope").load_extension "dap"
-- _ = require("telescope").load_extension "notify"
-- _ = require("telescope").load_extension "file_browser"
-- _ = require("telescope").load_extension "ui-select"
-- _ = require("telescope").load_extension "fzf"
-- _ = require("telescope").load_extension "git_worktree"
-- _ = require("telescope").load_extension "neoclip"

-- pcall(require("telescope").load_extension, "smart_history")
-- pcall(require("telescope").load_extension, "frecency")
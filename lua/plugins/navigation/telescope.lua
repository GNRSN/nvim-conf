local util = require("util")

-- this will return a function that calls telescope.
-- cwd will default to util.get_root
-- for `files`, git_files or find_files will be chosen depending on .git
local function tele(builtin, opts)
  return function()
    opts = vim.tbl_deep_extend("force", { cwd = util.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    require("telescope.builtin")[builtin](opts)
  end
end

-- LATER: This can replace grep_string and will instead paste the search word so it can be edited
--
-- map(
--   "v",
--   "<leader>fs",
--   "\"zy<cmd>exec \"Telescope grep_string default_text=\" . escape(@z, \" \")<cr>",
--   { desc = "Telescope grep for selection" }
-- ) -- find string in current working directory as you type

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
      -- find
      -- REVIEW: Trying out frecency plugin
      -- { "<leader><space>", "<Cmd>Telescope frecency workspace=CWD<CR>", desc = "Find Files (cwd)" },
      --
      { "<leader><space>", tele("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", tele("files"), desc = "Find Files (root dir)" },
      { "<leader>fs", tele("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>fs", tele("grep_string"), mode = { "v" }, desc = "Find selection in Files (Grep)" },
      { "<leader>fS", tele("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", tele("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      {
        "<leader>fB",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "Telescope file browser",
      },

      -- git
      { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>sgb", "<cmd>Telescope git_branches<CR>", desc = "commits" },
      { "<leader>sgc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>sgC", "<cmd>Telescope git_bcommits<CR>", desc = "buffer commits" },

      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", tele("grep_string"), desc = "Word (root dir)" },
      { "<leader>sW", tele("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>uC",
        tele("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
      {
        "<leader>fls",
        tele("lsp_document_symbols", {
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
        "<leader>flS",
        tele("lsp_workspace_symbols", {
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
    config = function(opts)
      local actions = require("telescope.actions")
      require("telescope").setup({
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
                tele("find_files", { no_ignore = true })()
              end,
              ["<a-h>"] = function()
                tele("find_files", { hidden = true })()
              end,
              ["<C-Down>"] = function(...)
                return actions.cycle_history_next(...)
              end,
              ["<C-Up>"] = function(...)
                return actions.cycle_history_prev(...)
              end,
              ["<C-f>"] = function(...)
                return actions.preview_scrolling_down(...)
              end,
              ["<C-b>"] = function(...)
                return actions.preview_scrolling_up(...)
              end,
              -- Shouldn't need normal mode in telescope so exit on first esc
              ["<esc>"] = function(...)
                return actions.close(...)
              end,
              ["<C-h>"] = "which_key",
            },
          },
        },
        -- LATER: This isn't working, I guess because of how we're calling telescope
        pickers = {
          find_files = {
            theme = "dropdown",
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
      })

      -- _ = require("telescope").load_extension "dap"
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

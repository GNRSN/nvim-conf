return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Basics
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "tjdevries/complextras.nvim", -- Matching lines in workspace TODO: setup
    -- Lsp
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind.nvim", -- pictograms
    "js-everts/cmp-tailwind-colors",
    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets", -- useful snippets
    -- Misc integrations
    "chrisgrieser/cmp_yanky", -- from clipboard history
  },
  config = function()
    local cmp = require("cmp")
    -- TODO: Get pack previous behavior with typeahead
    -- TODO: Register custom snippets, see TJs conf
    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        -- Vim config to define completion behavior
        completeopt = "menu,menuone,preview,noselect",
      },
      experimental = {
        ghost_text = true,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        -- Register luasnip as our snippet engine of choice
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- sources for autocompletion
      -- NOTE: order of sources effect order in UI
      sources = cmp.config.sources({
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
      }, {
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
        { name = "cmp_yanky" },
      }),
      mapping = cmp.mapping.preset.insert({
        -- NOTE: TJs mappings
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-q>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { "i", "c" }
        ),
        ["<M-i>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          { "i", "c" }
        ),

        ["<c-space>"] = cmp.mapping({
          i = cmp.mapping.complete(),
          c = function(
            _ --[[fallback]]
          )
            if cmp.visible() then
              if not cmp.confirm({ select = true }) then
                return
              end
            else
              cmp.complete()
            end
          end,
        }),

        -- ["<tab>"] = false,
        ["<tab>"] = cmp.config.disable,

        -- Testing
        ["<c-q>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      }),
      -- NOTE: Copied from TJ
      ---@diagnostic disable-next-line: missing-fields
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,

          -- copied from cmp-under, but I don't think I need the plugin for this.
          -- I might add some more of my own.
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find("^_+")
            local _, entry2_under = entry2.completion_item.label:find("^_+")
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,

          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      -- configure lspkind for vs-code like pictograms in completion menu
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = function(entry, item)
          if item.kind == "Color" then
            item = require("cmp-tailwind-colors").format(entry, item)

            if item.kind ~= "Color" then
              -- Emulate other tw class-names
              item.menu = "[LSP]"
              -- NOTE: This doesn't actually write out color,
              -- it makes the box as wide as the transparent though which is keyed icon + "color"
              item.kind = item.kind .. "Color"
              return item
            end
          end

          item = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
              buffer = "[buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[api]",
              path = "[path]",
              luasnip = "[snip]",
            },
          })(entry, item)

          return item
        end,
      },
    })
  end,
}

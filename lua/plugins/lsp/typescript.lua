return {
  -- Bespoke tsserver wrapper for better TS performance,
  -- since nvim-lspconfig didn't seem to let me conf tsserver as I would have liked I'm trying this out as an alternative to
  -- manually setting up the typescript LSP experience from scratch
  -- REVIEW: Maybe lspconfig did support this but it was just poorly documented
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("typescript-tools").setup({
        settings = {
          tsserver_path = require("util.typescript").get_tsdk_from_config(),
        },
      })
    end,
  },
}

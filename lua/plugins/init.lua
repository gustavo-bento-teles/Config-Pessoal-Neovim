return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {},
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      { "akinsho/toggleterm.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "folke/which-key.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function ()
      require("configs.platformio")
    end
  },
}

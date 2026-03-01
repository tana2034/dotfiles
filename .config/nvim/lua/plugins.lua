-- ~/.config/nvim/lua/plugins.lua

return {
  -- カラースキーム
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- 他のプラグインより先にロード
    config = function()
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- ステータスバー
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "gruvbox" } })
    end,
  },

  -- ファイルツリー
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
  },

  -- ファジーファインダー（ファイル・テキスト検索）
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find buffers" })
    end,
  },

  -- シンタックスハイライト
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "bash", "json", "yaml", "markdown" },
        highlight = { enable = true },
        indent   = { enable = true },
      })
    end,
  },
}

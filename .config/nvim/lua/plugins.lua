-- ~/.config/nvim/lua/plugins.lua

return {
  -- Colorscheme
  { "ellisonleao/gruvbox.nvim" },

  -- Other plugins here...

  -- Configure lazy.nvim to load colorscheme
  { "folke/lazy.nvim",
    opts = {
      colorscheme = "gruvbox",
    }
  }
}

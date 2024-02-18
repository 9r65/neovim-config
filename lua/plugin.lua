local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
    "stevearc/dressing.nvim",
    dependencies = {"MunifTanjim/nui.nvim"}
}, "nvim-lua/plenary.nvim", {
    "nvim-tree/nvim-web-devicons",
    lazy = true
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"}
}, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}, {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"}
}, {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp"
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {{'nvim-lua/plenary.nvim'}, {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }}
}, {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
}, {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "olimorris/neotest-phpunit",
    }
},{
        "navarasu/onedark.nvim"
    },
    {
        "folke/trouble.nvim",
         dependencies = { "nvim-tree/nvim-web-devicons" }
    },
{
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
}, {"numToStr/Comment.nvim"}, {"lewis6991/gitsigns.nvim"}, {"stevearc/dressing.nvim"}, {"williamboman/mason.nvim"},
                       {"neovim/nvim-lspconfig"}, {"williamboman/mason-lspconfig.nvim"}, {
    'hrsh7th/nvim-cmp',
    dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline"}
}})

require "plugins.nvim-tree"
require "plugins.treesitter"
require "plugins.lualine"
require "plugins.nvim-cmp"
require "plugins.telescope"
require "plugins.gitsigns"
require "plugins.dressing"
require "plugins.toggleterm"
require "plugins.bufferline"
require "plugins.neotest"
require "plugins.comment"
require "plugins.trouble"

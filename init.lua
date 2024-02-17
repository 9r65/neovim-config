vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- nvim-tree 必须关闭netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- config neovide font


vim.o.guifont = "FiraMono_Nerd_Font_Mono:h14" -- text below applies for VimScript

require "plugin"
require "options"
require "keymaps"
require "colorscheme"
require "lsp"

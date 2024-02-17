local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    fileencoding = "utf-8",
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = {"menuone", "noselect"}, -- mostly just for cmp
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    swapfile = false, -- creates a swapfile
    undofile = true, -- enable persistent undo
    timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 100, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    background = "light", -- set background color
    -- guifont = "monospace:h17",               -- the font used in graphical neovim applications

    whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
    termguicolors = true -- set termguicolors to enable highlight groups
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- others
vim.opt.iskeyword:append "-" -- hyphenated words recognized by searches

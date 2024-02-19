local opts = {
    noremap = true,
    silent = true
}
local term_opts = {
    silent = true
}

local keymap = vim.keymap.set

keymap({"n", "v"}, "<leader>r", "<cmd>e<CR>")
keymap({"n", "v"}, "<leader>s", "<cmd>update<CR>", opts)

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap({"n", "v"}, "<leader>z", "<cmd>lua require'telescope.builtin'.treesitter()<CR>", opts)
keymap({"n", "v"}, "<leader>F", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap({"n", "v"}, "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap({"n", "v"}, "<leader>tp", "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>", opts)
keymap({"n", "v"}, "<leader>B", "<cmd>History<CR>", opts)

-- nvim-tree
keymap({"n", "v"}, "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
keymap({"n", "v"}, "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>", opts)

-- telescope for lsp
keymap({"n", "v"}, "<leader>lq", "<cmd>TroubleToggle<CR>", opts)
keymap({"n", "v"}, "<leader>ag", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap({"n", "v"}, "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
keymap({"n", "v"}, "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", opts)
keymap({"n", "v"}, "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)

-- terminal
keymap({"n", "v"}, "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<leader>gg", "<cmd>lua _GITUI_TOGGLE()<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- test
keymap({"n","v"}, "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>",opts);
keymap({"n","v"}, "<leader>tnn", "<cmd>lua require('neotest').run.run_last()<CR>",opts);

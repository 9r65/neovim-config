local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local function nvim_tree_on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'x', api.node.navigate.parent_close, opts('close parent'))
    vim.keymap.set('n', 'X', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    on_attach = nvim_tree_on_attach,
    sort_by = "case_sensitive",
    view = {
        -- hide_root_folder = false
    },
    renderer = {},
    filters = {
        dotfiles = false
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400
    }

}

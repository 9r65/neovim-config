local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end


local project_actions = require("telescope._extensions.project.actions")

telescope.setup {
    pickers={
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            theme = "dropdown"
        },
        treesitter = {
            theme = "dropdown"
        },
    },
    defaults = {
        vimgrep_arguments = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},
        layout_strategy = "horizontal",
        color_devicons = true,

        file_ignore_patterns = {".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip"},
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8
            },
            vertical = {
                mirror = false
            },
            width = 0.8,
            preview_cutoff = 120
        },

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        project = {
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true,
            on_project_selected = function(prompt_bufnr)
            project_actions.change_working_directory(prompt_bufnr, false)
                --require("harpoon.ui").nav_file(1)
            end
        },
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('project')

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local lga_actions = require("telescope-live-grep-args.actions")


telescope.setup {
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
            width = 0.85,
            height = 0.92,
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
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({
                        postfix = " --iglob "
                    })
                }
            }
        }
    }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("live_grep_args")

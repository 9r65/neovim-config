local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = ""
}

local fileformat = {
    'fileformat',
    symbols = {
        unix = '',
        dos = '',
        mac = ''
    },
    color = {
        fg = colors.green,
        gui = 'bold'
    }
}

local progress = {
    function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = {"__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"}
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
    end,
    color = {
        fg = colors.fg,
        gui = 'bold'
    }
}

local encoding = {
    "o:encoding",
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = {
        fg = colors.green,
        gui = 'bold'
    }
}

local diff = {
    "diff",
    symbols = {
        added = ' ',
        modified = '󰝤 ',
        removed = ' '
    },
    diff_color = {
        added = {
            fg = colors.green
        },
        modified = {
            fg = colors.orange
        },
        removed = {
            fg = colors.red
        }
    },
    cond = conditions.hide_in_width
}

local filename = {
    'filename',
    cond = conditions.buffer_not_empty,
    color = {
        fg = colors.magenta,
        gui = 'bold'
    }
}

local diagnostics = {
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn", "info"},
    symbols = {
        error = " ",
        warn = " ",
        info = ' '
    },
    diagnostics_color = {
        color_error = {
            fg = colors.red
        },
        color_warn = {
            fg = colors.yellow
        },
        color_info = {
            fg = colors.cyan
        }
    },
    update_in_insert = false,
    always_visible = true
}

local lsp = {
    function()
        local msg = 'No Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = {
        fg = '#ffffff',
        gui = 'bold'
    }
}

lualine.setup({
    options = {
        icons_enabled = true,
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
         --theme = 'onedark'
       -- theme = {
       --     normal = {
       --         c = {
       --             fg = colors.fg,
       --             bg = colors.bg
       --         }
       --     },
       --     inactive = {
       --         c = {
       --             fg = colors.fg,
       --             bg = colors.bg
       --         }
       --     }
       -- }

    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {filename, 'location'},
        lualine_c = {progress, diagnostics},

        lualine_x = {encoding, fileformat},
        lualine_y = {branch},
        lualine_z = {diff}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {fileformat},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }

})

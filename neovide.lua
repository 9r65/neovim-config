if vim.g.neovide then
    print "Welcome Neovide!"
    vim.o.guifont = "FiraMono_Nerd_Font_Mono:h14" -- text below applies for VimScript
    -- hidden mouse when typing
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_confirm_quit = true

    -- disable IME when using normal models
    vim.g.neovide_input_ime = true

    vim.g.neovide_cursor_animation_length = 0.1

    local function set_ime(args)
        if args.event:match("Enter$") then
            vim.g.neovide_input_ime = true
        else
            vim.g.neovide_input_ime = false
        end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = ime_input,
        pattern = "*",
        callback = set_ime
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = ime_input,
        pattern = "[/\\?]",
        callback = set_ime
    })
end

if vim.g.neovide then
    print "Welcome Neovide!"
    vim.o.guifont = "FiraMono_Nerd_Font_Mono:h14" -- text below applies for VimScript
    -- hidden mouse when typing
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_cursor_animation_length = 0
end

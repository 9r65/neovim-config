local status_ok, config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end




config.setup{
        ensure_installed = {"sql", "bash", "dockerfile", "html", "javascript", "make", "go", "gomod", "json", "lua","php", "phpdoc", "toml", "yaml", "c", "vim", "vimdoc","markdown"},
        sync_install = true,

        highlight = {
            enable = true,
            disable = {"css"},
            additional_vim_regex_highlighting = false
        },
        autopairs = {
            enable = true
        },
        indent = {
            enable = true,
            disable = {"python", "css"}
        },

        context_commentstring = {
            enable = true,
            enable_autocmd = false
        }
}

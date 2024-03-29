local servers = {"bashls", "dockerls", "lua_ls", "intelephense", "volar"}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍"
        }
    }
    -- log_level = vim.log.levels.DEBUG,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handler").on_attach,
        capabilities = require("lsp.handler").capabilities
    }
    server = vim.split(server, "@")[1]
    local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end

local onedark_status_ok, onedark = pcall(require, 'onedark')
if not onedark_status_ok then
    return
end

onedark.setup {
    style = 'light'
}

onedark.load()

--vim.cmd [[colorscheme onedark]]

local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

trouble.setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    auto_open = true, 
    auto_close = true,
    mode = "document_diagnostics",
}


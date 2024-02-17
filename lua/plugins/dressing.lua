local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

dressing.setup({
    select = {
        get_config = function(opts)
            print(opts)
            if opts.kind == 'codeaction' then
                return {
                    backend = 'nui',
                    nui = {
                        max_width = 40
                    }
                }
            end
        end
    }
})

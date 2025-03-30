-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local args = vim.fn.argv()

        if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
            --vim.api.nvim_command("Neotree")
        end
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local args = vim.fn.argv()

        if #args ~= 1 or vim.fn.isdirectory(args[1]) ~= 1 then
            return
        end

        vim.cmd("Neotree reveal")
        -- hacky fix for line numbers showing up on start for neo-tree. todo: figure out
        vim.wo.number = false
        vim.wo.relativenumber = false
    end,
})

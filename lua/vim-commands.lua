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

--[[
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local path = vim.fn.expand("%:p")
        if vim.fn.isdirectory(path) ~= 1 then
            return
        end

        -- Open Neo-tree focused on the directory
        -- vim.cmd("Neotree position=left dir=" .. path)
    end,
})
]]
--

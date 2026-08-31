-- Better Around/Inside textobjects
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require("mini.ai").setup({ n_lines = 500 })

-- Auto-close brackets, quotes, etc.
require("mini.pairs").setup()

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
--  - sd'   - [S]urround [D]elete [']quotes
--  - sr)'  - [S]urround [R]eplace [)] [']
require("mini.surround").setup()


require("mini.pick").setup()

-- Statusline
local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
    return "%2l:%-2v"
end

-- Buffer tab line and removal
require("mini.tabline").setup()
vim.keymap.set("n", "<S-h>", "<Cmd>bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bc", function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd("bprevious")
    vim.api.nvim_buf_delete(buf, {})
end, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bf", function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd("bprevious")
    vim.api.nvim_buf_delete(buf, { force = true })
end, { desc = "Close buffer (force)" })

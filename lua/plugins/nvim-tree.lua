require("nvim-tree").setup({
    filters = {
        dotfiles = false,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 30,
    },
    actions = {
        change_dir = {
            enable = false,
        },
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        -- Override Enter on root folder to collapse instead of navigating up
        vim.keymap.set("n", "<CR>", function()
            local node = api.tree.get_node_under_cursor()
            if node and node.name == ".." then
                return
            end
            api.node.open.edit()
        end, { buffer = bufnr, desc = "Open" })
    end,
})

vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFindFile<CR>", { desc = "File explorer" })
vim.keymap.set("n", "<leader>er", "<Cmd>NvimTreeRefresh<CR>", { desc = "Explorer refresh" })

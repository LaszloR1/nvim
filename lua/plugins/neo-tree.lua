return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    keys = {
        { "<leader>nt", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
            window = {
                mappings = {
                    ["\\"] = "close_window",
                },
            },
        },
    },
}

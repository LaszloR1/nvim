require("fff").setup({})

vim.keymap.set("n", "<leader>sf", function()
    require("fff").find_files()
end, { desc = "[S]earch [F]iles" })

vim.keymap.set("n", "<leader>sg", function()
    require("fff").live_grep()
end, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sn", function()
    require("fff").find_files_in_dir(vim.fn.stdpath("config"))
end, { desc = "[S]earch [N]eovim files" })

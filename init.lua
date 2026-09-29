-- Plugin declarations (vim.pack — built into Neovim 0.12)
local plugins = {
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/folke/todo-comments.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/stevearc/conform.nvim",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0") },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/danymat/neogen",
}

if not vim.g.nvim_fff_managed then
    table.insert(plugins, "https://github.com/dmtrKovalenko/fff.nvim")
    vim.api.nvim_create_autocmd("PackChanged", {
        callback = function(event)
            local data = event.data
            if data.spec.name == "fff.nvim" and (data.kind == "install" or data.kind == "update") then
                if not data.active then
                    vim.cmd("packadd! fff.nvim")
                end
                require("fff.download").download_or_build_binary()
            end
        end,
    })
end

vim.pack.add(plugins)

-- Core configuration
require("vim-options")
require("vim-commands")
require("lsp")

-- Plugin configuration
require("plugins.tokyo-night")
require("plugins.mini")
require("plugins.which-key")
require("plugins.gitsigns")
require("plugins.nvim-tree")
require("plugins.todo")
require("plugins.conform")
require("plugins.blink-cmp")
require("plugins.fff")
require("plugins.nvim-treesitter")
require("plugins.neogen")

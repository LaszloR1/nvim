require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        php = { lsp_format = "prefer" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        nix = { "nixfmt" },
        rust = { "rustfmt" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({ async = false, lsp_format = "fallback" })
end, { desc = "Format buffer" })

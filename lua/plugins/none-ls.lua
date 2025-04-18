return {
    "nvimtools/none-ls.nvim",
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.alejandra,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.nixfmt,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

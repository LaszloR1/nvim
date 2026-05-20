---@brief
---
--- https://rust-analyzer.github.io/
---
--- Rust language server.

---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
}

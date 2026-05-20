require("blink.cmp").setup({
    keymap = {
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
    },
    completion = {
        accept = {
            auto_brackets = { enabled = true },
        },
        documentation = {
            auto_show = true,
            window = { border = "rounded" },
        },
        menu = {
            border = "rounded",
        },
    },
    signature = {
        enabled = true,
        window = { border = "rounded" },
    },
    sources = {
        default = { "lsp", "path", "snippets" },
    },
})

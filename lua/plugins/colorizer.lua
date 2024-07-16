return {
    { -- Display colours
        "NvChad/nvim-colorizer.lua",
        opts = {
            filetypes = {
                "*",
                cmp_docs = { always_update = true },
            },
            user_default_options = {
                names = false,
            },
        },
    },
}

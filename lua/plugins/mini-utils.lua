return {
    { -- UTILITY
        {
            'echasnovski/mini.files',
            version = false,
            opts = { content = { prefix = function() end }, }, -- remove icons
            event = "VeryLazy"
        },
        { 'echasnovski/mini.pick', version = false, },
    },
}

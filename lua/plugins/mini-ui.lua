return {
    { -- UI
        {
            'echasnovski/mini.hipatterns',
            version = false,
            opts = {
                highlighters = {
                    fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
                    hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
                    todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
                    note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
                }
            }
        },
        {
            'echasnovski/mini.starter',
            version = false,
            opts = {
                footer =
                "\n      |\\      _,,,---,,_\nZZZzz /,`.-'`'    -.  ;-;;,_\n     |,4-  ) )-,_. ,\\ (  `'-'\n    '---''(_/--'  `-'\\_)",
            }
        },
        { 'echasnovski/mini.tabline', version = false, opts = {} },
        {
            'echasnovski/mini.statusline',
            version = false,
            opts = {
                use_icons = false,
                set_vim_settings = false,
            },
        },
    },
}

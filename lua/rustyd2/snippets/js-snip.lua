local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
require("luasnip.session.snippet_collection").clear_snippets "ts-snip"
local rep = require("luasnip.extras").rep
local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt


--funcfunc
ls.add_snippets('javascript', {
    s('cl', fmta([[
    console.log("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})

ls.add_snippets('javascript', {
    s('cw', fmta([[
    console.warn("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})

ls.add_snippets('javascript', {
    s('ce', fmta([[
    console.error("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})
ls.add_snippets('javascript', {
    s('ct', c(1, {
        fmta([[
    console.time("<item>");
    ]],
            {
                item = i(1),
            }
        ),
        fmta([[
    console.timeEnd("<item>");
    ]],
            {
                item = i(1),
            }
        )
    })),
})

-- please note for `fmt` the rep should be last or it will throw nil exception
ls.add_snippets('javascript', {
    s('for',
        fmt([[
            for(let i = 0; i < {1}.length; i++){{
                const {2} = {4}[i];
                {3}
            }}
            ]],
            {
                i(1),
                i(2, 'element'),
                i(3),
                rep(1),
            }
        )
    ),
})

ls.add_snippets('javascript', {
    s('foro',
        fmt([[
            for(let {1} of {2}){{

            }}
            ]],
            {
                i(1, 'item'),
                i(2),
            }
        )
    ),
})

ls.add_snippets('javascript', {
    s('forn',
        fmt([[
            for(let {1} in {2}){{

            }}
            ]],
            {
                i(1, 'item'),
                i(2),
            }
        )
    ),
})


ls.add_snippets('javascript', {
    s('af',
        {
            t('const '),
            i(1),
            t(' = '),
            c(2, {
                fmt([[({1})=> {{
                    {2}
                }}
                ]], {
                    i(1),
                    i(2),
                }),
                fmt([[async ({1})=>{{
                    {2}
                }}
                ]], {
                    i(1),
                    i(2),
                }),
            }),
        }
    ),
})

ls.add_snippets('javascript', {
    s('import', fmta([[ import { <mod> } from '<modName>';]],
        {
            modName = i(1),
            mod = i(2),
        }))
})

ls.add_snippets('javascript', {
    s('title', fmta(
        [[/**********************************************
*       <title>
**********************************************/]],
        {
            title = i(1),
        }))
})

ls.add_snippets('javascript', {
    s('pro', t("const promises = [];")),

})

ls.add_snippets('javascript', {
    s('pra', c(1, {
        t("await Promise.all(promises)"),
        fmt([[const [{}]=await Promise.all(promises)]], i(1))
    }))
})

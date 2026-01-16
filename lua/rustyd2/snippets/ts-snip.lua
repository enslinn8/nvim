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
ls.add_snippets('typescript', {
    s('cl', fmta([[
    console.log("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})

ls.add_snippets('typescript', {
    s('cw', fmta([[
    console.warn("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})

ls.add_snippets('typescript', {
    s('ce', fmta([[
    console.error("<item>",<value>);
    ]],
        {
            item = i(1),
            value = i(2),
        }
    )),
})
ls.add_snippets('typescript', {
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
ls.add_snippets('typescript', {
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

ls.add_snippets('typescript', {
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

ls.add_snippets('typescript', {
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


ls.add_snippets('typescript', {
    s('af',
        {
            t('const '),
            i(1),
            t(' = '),
            c(2, {
                fmt([[({1}):{2} => {{
                    {3}
                }}
                ]], {
                    i(1),
                    i(2, 'void'),
                    i(3),
                }),
                fmt([[async ({1}):Promise<{2}> =>{{
                    {3}
                }}
                ]], {
                    i(1),
                    i(2, 'void'),
                    i(3),
                }),
            }),
        }
    ),
})

local type_choices = {
    i(1),
    t('string'),
    t('number'),
    t('boolean'),
}

ls.add_snippets('typescript', {
    s('prop', {
        i(1, 'key'),
        t(': '),
        c(2, type_choices),
    })
})

ls.add_snippets('typescript', {
    s('type', fmta([[
        type <itemType> = {
            <key>:<valueType>
        }
    ]],
        {
            itemType = "foo",
            key = "key",
            valueType = "string",
        }
    ))
})

ls.add_snippets('typescript', {
    s('import', fmta([[ import { <mod> } from '<modName>';]],
        {
            modName = i(1),
            mod = i(2),
        }))
})

ls.add_snippets('typescript', {
    s('title', fmta(
        [[/**********************************************
*       <title>
**********************************************/]],
        {
            title = i(1),
        }))
})

ls.add_snippets('typescript', {
    s('pro', t("const promises :any[] = [];")),

})

ls.add_snippets('typescript', {
    s('pra', c(1, {
        t("await Promise.all(promises)"),
        fmt([[const [{}]=await Promise.all(promises)]], i(1))
    }))
})

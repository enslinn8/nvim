local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt

--funcfunc
ls.add_snippets('typescript', {
    s('log', fmt('console.log("{}",{});',
        {
            i(1),
            i(2),
        })),
})

ls.add_snippets('typescript', {
    s('err', fmt('console.error("{}",{});',
        {
            i(1),
            i(2),
        })),
})

local functionsSnippets = { [[
                {}()=>{{
                    {}
                }}
            ]],
    [[
              {}()=>{{
                  {}
              }}
            ]]

}

--ls.add_snippets('lua', {
--    s('fu', fmt(functionsSnippets, {
--        i(1),
--        i(2),
--    })),
--})

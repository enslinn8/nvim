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
ls.add_snippets('html', {
    s('div', fmt('<div>{}</div>', {
        i(1),
    })),
})

ls.add_snippets('html', {
    s('button', fmt('<button>{}</button>', {
        i(1),
    })),
})

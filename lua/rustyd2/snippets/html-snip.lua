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
    s('div', c(1, {
        fmt('<div class="{}">{}</div>', {
            i(1),
            i(2),
        }),
        t('<div></div>'),
    }))
})


ls.add_snippets('html', {
    s('button', fmt('<button>{}</button>', {
        i(1),
    })),
})


ls.add_snippets('html', {
    s('input', c(1, {
        fmt("<input class='{}' placeholder='{}' value='{}'/>", {
            i(1),
            i(2),
            i(3),
        }),
        t("<input />"),
    })),
})
ls.add_snippets('html', {
    s('label', c(1, {
        fmt("<label for='{}' class='{}' placeholder='{}' value='{}'/>", {
            i(1),
            i(2),
            i(3),
            i(4),
        }),
        t("<label />"),
    })),
})

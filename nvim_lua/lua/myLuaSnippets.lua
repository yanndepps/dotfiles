local ls = require'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local c = ls.choice_node
local i = ls.insert_node
local l = require("luasnip.extras").lambda
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local date_input = function(args, state, fmt)
    local fmt = fmt or "!%Y-%m-%d"
    return sn(nil, i(1, os.date(fmt)))
end

local website_title = function()
    return sn(nil, i(i,
    vim.fn.expand('%:t:r'):gsub('-', ' '):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    ))
end
ls.snippets = {
    markdown = {

        s("a4",
        fmt(
        [[
        ---
        geometry: a4paper
        title: {}
        author: {} 
        titlepage: {}
        disable-header-and-footer: {}
        date: {}
        ---
        ]],
        {
            i(1, "Insert title here"),
            i(2, "Kenneth Flak" ),
            i(3, "false" ),
            i(4, "false"),
            d(5, date_input, {})
        }
        )
        ),

        s("hugo",
        fmt(
        [[
        +++
        title = "{}" 
        date = "{}"
        layout = "{}"
        author = "{}"
        about = "{}"
        toc = {}
        draft = {}
        +++
        ]],
        {
            d(1, website_title, {}),
            d(2, date_input, {}),
            i(3, "text"),
            i(4, "Külli Roosna"),
            i(5, "/about/kulli-roosna"),
            i(6, "false"),
            i(7, "false"),
        })
        ),

        s("zolablog",
        fmt(
        [[
        +++
        title = "{}" 
        date = "{}"

        [extra]
        author = "{}"
        +++
        ]],
        {
            d(1, website_title, {}),
            d(2, date_input, {}),
            i(3, "Külli Roosna"),
        })
        )
    }
}


ls.snippets.supercollider = require'scnvim/utils'.get_snippets()

-- Parse scdoc snippets to luasnip format
local scdocsnips = {}
for snipName, snipContents in pairs(require'scdoc-snippets') do

    local parsedSnip = ls.parser.parse_snippet({ trig = snipName }, snipContents)
    table.insert(scdocsnips, parsedSnip)
    -- print(value)
end

ls.snippets.scdoc = scdocsnips

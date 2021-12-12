-- Snippets for luasnip
local function prequire(...)
	local status, lib = pcall(require, ...)
	if (status) then return lib end
	return nil
end

local ls = prequire('luasnip')
local cmp = prequire("cmp")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local check_back_space = function()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
		return true
	else
		return false
	end
end
_G.tab_complete = function()
	if cmp and cmp.visible() then
		cmp.select_next_item()
	elseif ls and ls.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif check_back_space() then
		return t "<Tab>"
	else
		cmp.complete()
	end
	return ""
end
_G.s_tab_complete = function()
	if cmp and cmp.visible() then
		cmp.select_prev_item()
	elseif ls and ls.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t "<S-Tab>"
	end
	return ""
end

vim.cmd [[
	imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
	inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
	imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
	snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
	snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
	]]
	-- local t = function(str)
	-- 	return vim.api.nvim_replace_termcodes(str, true, true, true)
	-- end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- Returns a snippet_node wrapped around an insert_node whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, state, fmt)
	local fmt = fmt or "%d-%m-%Y"
	return sn(nil, i(1, os.date(fmt)))
end

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

ls.snippets = {
	all = {
		s("date", {
			d(1, date_input, {}, "%A, %B %d of %Y"),
		}),
	},
	-- supercollider = {
	-- 	s("doodoo", {
	-- 		t("It was a dark and stormy night on "),
	-- 		d(1, date_input, {}, "%A, %B %d of %Y"),
	-- 		t(" and the clocks were striking thirteen."),
	-- 	}),
	-- }
};

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend("lua", { "c" })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set("cpp", { "c" })

require("luasnip/loaders/from_vscode").load()

-- SCnvim snippets
require'luasnip'.snippets.supercollider = require'scnvim/utils'.get_snippets()

-- Add snippets from scnvim
-- local scnvim_snips = require'scnvim/utils'.get_snippets()

-- for snipname, sniptext in pairs(scnvim_snips) do
-- 	local size = #ls.snippets.supercollider
-- 	local classname = snipname:gsub("%..*","")

-- 	ls.snippets.supercollider[size+1] = ls.parser.parse_snippet({
-- 		trig = snipname,
-- 		name = snipname,
-- 		dscr = classname .. ". SCNvim auto generated snippet",
-- 		hidden = false,
-- 		wordTrig = true
-- 	}, sniptext)

-- end


--
-- Extra functions for SuperCollider / scnvim
-- by Mads Kjeldgaard , 2020
-- for Nvim => v0.5

local M = {}

-- Init function
-- Run this to register commands that interface with the functions here
function M.init()
	-- Download source code for supercollider (for developing)
	vim.cmd("command! SCGetSource lua require('scnvim_extra').get_sc_source()")

	-- Create a plugin project using a cookiecutter template
	vim.cmd("command! SCPlugin lua require('scnvim_extra').create_plugin()")

	-- Create a Quark project using a cookiecutter template
	vim.cmd("command! SCQuark lua require('scnvim_extra').create_quark()")

	-- Use fuzzy finding (fzf / skim) to search for help and find definitions
	vim.cmd("command! SCNvimFuzzyHelp lua require('scnvim_extra').scnvim_fuzzy_help()")
	vim.cmd("command! SCNvimFuzzyDefinitions lua require('scnvim_extra').scnvim_fuzzy_definition()")

	vim.cmd("command! SCNvimFuzzyDefinitions lua require('scnvim_extra').scnvim_fuzzy_definition()")

	vim.cmd("command! SCCompileThis lua require('scnvim_extra').sc_compile_plugin()")

	vim.g.scnvim_fuzzy_command = vim.g.scnvim_fuzzy_command or "skim"

end

local function fzf(sources, sinkfunc, custom_options)
	local cmd = vim.g.scnvim_fuzzy_command;
	local fzf_run = vim.fn[cmd .. "#run"]
	local fzf_wrap = vim.fn[cmd .. "#wrap"]

	local wrapped = fzf_wrap("test", {
		source = sources,
		options = custom_options or {'--reverse'},
		-- don't set `sink` or `sink*` here
	})

	wrapped["sink*"] = nil   -- this line is required if you want to use `sink` only
	wrapped.sink = sinkfunc
	fzf_run(wrapped)
end

-- Unpack csv file with tags into lua table
local function scnvim_help_table()
	local root = vim.g.scnvim_root_dir
	local classes = root .. "/scnvim-data/tags"
	local tagsfile = io.open(classes)
	local help = {}

	for line in tagsfile:lines() do
		local tagname, tagpath, _, _= line:match("%s*(.-)\t%s*(.-)\t%s*(.-)\t%s*(.-)")
		help[tostring(tagname)] = tagpath
		-- print(tagname)
	end

	return help
end

function M.scnvim_fuzzy_definition()
	local help = scnvim_help_table()
	local help_keys = {};

	for k,_ in pairs(help) do
		table.insert(help_keys, k)
	end

	fzf(help_keys, function(class_name)
		local key = tostring(class_name)
		local lookup_path = help[key]
		vim.cmd("spl " .. lookup_path)
	end)
end

M.open_help = vim.fn["scnvim#help#open_help_for"]

function M.scnvim_fuzzy_help()
	local help = scnvim_help_table()
	local help_keys = {};

	for k,_ in pairs(help) do
		table.insert(help_keys, tostring(k))
	end

	fzf(help_keys, function(class_name)
		M.open_help(tostring(class_name))
	end)
end

-- Cookiecutter templates
local function cookiecutter(url)
	local cmd = "cookiecutter " .. url
	local executable = vim.call("executable", "cookiecutter")
	if executable == 1 then
		vim.cmd("term " .. cmd)
	else
		vim.api.nvim_err_writeln("cookiecutter not executable!")
	end
end

function M.create_plugin()
	local url = "https://github.com/supercollider/cookiecutter-supercollider-plugin"
	cookiecutter(url)
end

function M.create_quark()
	local url = "https://github.com/madskjeldgaard/cookiecutter-quark"
	cookiecutter(url)
end

function M.get_sc_source()
	local url = "https://github.com/supercollider/supercollider/"
	local cmd = "git clone --recurse-submodules " .. url
	local executable = vim.call("executable", "git")
	if executable == 1 then
		vim.cmd("term " .. cmd)
	else
		vim.api.nvim_err_writeln("Git not executable!")
	end
end

-- For compiling Supercollider plugins
-- Expects vim to be inside plugin directory
function M.sc_compile_plugin()
	local sc_source_path = "/home/mads/supercollider"
	local cmake_cmd = string.format("cmake build/ -DSC_PATH=%s -DCMAKE_BUILD_TYPE=Debug", sc_source_path)
	local build_cmd = "cmake --build build --config Debug"
	local cmd = cmake_cmd .. " && " .. build_cmd

	vim.cmd("spl term://" .. cmd)
end

return M

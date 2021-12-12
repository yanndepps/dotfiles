local M = {}

local api = vim.api

function M.fzf(sources, sinkfunc)
	local fzf_run = vim.fn["fzf#run"]
	local fzf_wrap = vim.fn["fzf#wrap"]

	local wrapped = fzf_wrap("test", {
		source = sources,
		options = {'--reverse'},
		-- don't set `sink` or `sink*` here
	})
	wrapped["sink*"] = nil   -- this line is required if you want to use `sink` only
	wrapped.sink = sinkfunc
	fzf_run(wrapped)
end

function M.insert_text(text)
	vim.api.nvim_paste(text, true, 1)
end

function M.shell(command)
	local lines = {}
    local file = io.popen(command)

    for line in file:lines() do
        table.insert(lines, line)
    end

    file:close()

    return lines
end

-- Find email adress using notmuch and fzf and paste it
function M.notmuch_address()
	local cmd = 'notmuch address "*"'
	local addresses = M.shell(cmd)
	M.fzf(addresses, M.insert_text)
end

-- Find and insert path to email attachment
function M.find_attachment()
	local cmd = 'fd . ~ -t f'
	local filelist = M.shell(cmd)
	M.fzf(filelist, M.insert_text)
end

function M.fzf_find_scnvim_help()
	local cmd = 'fd .txt ~/.local/share/SuperCollider/Help -t f'
	local filelist = M.shell(cmd)
	M.fzf(filelist, function(file_path)
		require('scnvim/help').open(file_path, '')
	end)
end

-- Edit one of recent files
function M.fzf_recent_files()
	local opencmd = "tabnew"
	local filelist = api.nvim_get_vvar("oldfiles")
	local newtab = function(file) api.nvim_command(string.format("%s %s", opencmd, file)) end

	M.fzf(filelist, newtab)
end

-- Edit one of files in current directory
function M.fzf_files()
	local opencmd = "tabnew"
	local filelist = M.shell("fd . . -t f")
	local newtab = function(file) api.nvim_command(string.format("%s %s", opencmd, file)) end

	M.fzf(filelist, newtab)
end

return M

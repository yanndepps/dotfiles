local M = {}
local api = vim.api

function M.mappings()
    M.div()
    M.movements()
    M.snippets()
    -- M.make()
    -- M.nvim_compe()
    -- M.nvim_dap()
end


function M.bufmaps(mapdict, opts)
    for m = 1, #mapdict do
        local mode = mapdict[m][1]
        local lhs = mapdict[m][2]
        local rhs = mapdict[m][3]
        local buffer = 0

        api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
    end
end

function M.maps(mapdict, opts)
    for m = 1, #mapdict do
        local mode = mapdict[m][1]
        local lhs = mapdict[m][2]
        local rhs = mapdict[m][3]

        api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

function M.movements()
    local opts = { nowait = true, noremap = true, silent = false }
    local maps = {

        {'v', 'H', '^'},
        {'v', 'L', '$'},
        {'n', 'H', '^'},
        {'n', 'L', '$'},
        {'o', 'H', '^'},
        {'o', 'L', '$'},

        {'n', 'j', 'gj'},
        {'n', 'k', 'gk'},

        -- a.vim: new split with alternate file
        {'n', 'mv', [[:AV<cr>]]},
        -- switch in same window
        {'n', 'ma', [[:A<cr>]]},
    }

    M.maps(maps, opts)
end

function M.div()
    local opts = { nowait = true, noremap = true, silent = false }
    local maps = {
        -- FZF
        {'n', '<C-p>', [[:<C-u>FZF --reverse<CR>]]},
        {'n', '<C-g>', [[:Rg<CR>]]},
        {'n', '<C-b>', [[:Buffers<CR>]]},

        -- exit terminal mode
        {'t', '<Esc>', '<C-\\><C-n>'},

    }

    M.maps(maps, opts)
end

function M.nvim_compe()
    local opts = { silent = true, expr = true }
    local maps = {
        -- {'i', '<C-space>', [[compe#complete()]]},
        {'i', '<C-Space>', [[compe#confirm('<CR>')]]},
        -- {'i', '<CR>', [[compe#confirm('<CR>')]]},
    }
    M.maps(maps, opts)
end

function M.fzf_mail()
    local opts = { nowait = true, noremap = true, silent = true }
    local callfunc = function (name)
        return string.format(":lua require'functions'.%s()<cr>", name)
    end

    local bufmaps = {
        -- Find address and insert
        {'n', '<C-a>', '$' .. callfunc("notmuch_address")},
        {'i', '<C-a>', '<esc>$' .. callfunc("notmuch_address")},

        -- Find attachment and insert
        {'n', '<C-t>', 'iAttach: ' .. '<esc>' .. callfunc("find_attachment")},
        {'i', '<C-t>', 'Attach: ' .. '<esc>' .. callfunc("find_attachment")},
    }

    M.bufmaps(bufmaps, opts)
end

function M.supercollider()
    local opts = { nowait = true, noremap = true, silent = true }
    local bufmaps = {
        {'n', '<C-y>', ':SCNvimFuzzyHelp<cr>' },
        {'n', '<F2>', ':SCNvimStart<cr>' },
        {'n', '<F4>', ':SCNvimRecompile<cr>' },
        {'n', '<F5>', [[:call scnvim#sclang#send('s.plotTree')<CR>]] },
        {'n', '<F6>', [[:call scnvim#sclang#send('s.meter')<CR>]] },
        -- {'n', '<F7>', [[:call scnvim#sclang#send('Japa.new')<CR>]] },
        {'n', '<F8>', [[:call scnvim#sclang#send('if(s.isRecording){s.stopRecording}{s.record("~/Musique/Samplz/sc-rec"+/+PathName(thisProcess.nowExecutingPath).fileNameWithoutExtension+/+Date.localtime.stamp++".wav", numChannels: s.options.numOutputBusChannels)}')<CR>]] },
    }

    M.bufmaps(bufmaps, opts)

    local plugmapopts = { nowait = true, noremap = false, silent = true }
    local plugmaps = {
        {'n', '<C-e>', '<Plug>(scnvim-send-block)' },
        -- {'n', '<Space>', '<Plug>(scnvim-send-block)' },
        -- {'n', '<C-e>', '<Plug>(scnvim-send-selection)' },
        -- {'v', '<C-e>', '<Plug>(scnvim-send-selection)' },
        {'n', '<CR>', '<Plug>(scnvim-postwindow-toggle)' },
        {'n', '<C-l>', '<Plug>(scnvim-postwindow-clear)' },
        {'n', '<F12>', '<Plug>(scnvim-hard-stop)' },
        {'n', '<C-k>', '<Plug>(scnvim-hard-stop)' },
    }

    M.bufmaps(plugmaps,plugmapopts)

end

function M.lsp()
    local opts = { nowait = true, noremap = true, silent = true }
    local maps = {
        {'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>'},
        {'n', '<c-k>', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
        {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
        {'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
        {'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},
        {'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
    }

    M.bufmaps(maps, opts)
end

function M.snippets()
    local opts = { nowait = true, noremap = true, silent = true }
    local maps = {
        -- Reload snippets setup to load new/changed snippets
        {'n','<leader>rs', ':lua package.loaded["luasnip"]=nil; package.loaded["myLuaSnippets"]=nil; require"myLuaSnippets"<cr>'},
    }

    M.maps(maps, opts)
end

return M

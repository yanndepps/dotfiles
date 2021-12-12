-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/depps/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/depps/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/depps/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/depps/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/depps/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    config = { "\27LJ\1\2š\6\0\0\6\0\28\0\0314\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\n\0003\3\4\0003\4\3\0:\4\5\0033\4\6\0:\4\a\0033\4\b\0:\4\t\3:\3\v\0023\3\19\0003\4\f\0003\5\r\0:\5\14\0043\5\15\0:\5\16\0043\5\17\0:\5\18\4:\4\20\0033\4\21\0:\4\22\3:\3\23\0023\3\24\0:\3\25\0023\3\26\0:\3\27\2>\1\2\1G\0\1\0\tmisc\1\0\3\19cursor_by_mode\1\20on_off_commands\1\25ui_elements_commands\1\17integrations\1\0\3\18vim_gitgutter\2\15galaxyline\2\ttmux\2\nmodes\nfocus\1\0\2\17focus_method\17experimental\20margin_of_error\3\5\rataraxis\1\0\0\22affected_higroups\1\0\a\17StatusLineNC\2\15FoldColumn\2\16ColorColumn\2\15StatusLine\2\14VertSplit\2\15SignColumn\2\fNonText\2\14custom_bg\1\3\0\0\tnone\5\29ideal_writing_area_width\1\2\0\0\3\0\1\0\t\18right_padding\3 \17auto_padding\2\19bottom_padding\3\1\tquit\runtoggle\16top_padding\3\1\17left_padding\3 \21bg_configuration\2 keep_default_fold_fillchars\2\28ignore_floating_windows\2\aui\1\0\0\tleft\1\0\3\15signcolumn\ano\19relativenumber\1\vnumber\1\btop\1\0\1\16showtabline\3\0\vbottom\1\0\0\1\0\5\rshowmode\1\fshowcmd\1\15laststatus\3\0\nruler\1\14cmdheight\3\1\nsetup\rtrue-zen\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["a.vim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/a.vim",
    url = "https://github.com/vim-scripts/a.vim"
  },
  ["ack.vim"] = {
    config = { "\27LJ\1\2©\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\5\0%\1\6\0>\0\2\1G\0\1\0\25cnoreabbrev Ack Ack!\bcmd#ack_use_cword_for_empty_search-rg --vimgrep --type-not sql --smart-case\vackprg\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ["calendar-vim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/calendar-vim",
    url = "https://github.com/mattn/calendar-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-sc"] = {
    config = { "\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vfzf-sc\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/fzf-sc",
    url = "https://github.com/madskjeldgaard/fzf-sc"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19galaxylineconf\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim",
    url = "https://github.com/eddyekofo94/gruvbox-flat.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2J\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\1\0:\1\2\0G\0\1\0-indent_blankline_show_first_indent_level\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lir-git-status.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/lir-git-status.nvim",
    url = "https://github.com/tamago324/lir-git-status.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\1\2G\0\0\2\1\4\0\b+\0\0\0007\0\0\0>\0\1\0014\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\1À\14normal! j\bcmd\bvim\16toggle_markü\1\0\0\6\0\f\0\0254\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\0\6\0014\0\0\0007\0\1\0007\0\a\0002\1\3\0003\2\v\0004\3\0\0007\3\b\0037\3\t\3%\4\n\0>\3\2\2;\3\1\2;\2\1\1)\2\1\0002\3\0\0>\0\4\1G\0\1\0\1\3\0\0\0\vNormal\b%:p\vexpand\afn\14nvim_echo\1\0\2\vsilent\2\fnoremap\2=:<C-u>lua require\"lir.mark.actions\".toggle_mark(\"v\")<CR>\6J\6x\24nvim_buf_set_keymap\bapi\bvimŽ\a\1\0\a\0>\0V4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0024\2\0\0%\3\3\0>\2\2\0024\3\0\0%\4\4\0>\3\2\0027\3\5\0033\4\6\0003\5\b\0007\6\a\0:\6\t\0057\6\a\0:\6\n\0057\6\v\0:\6\f\0057\6\r\0:\6\14\0057\6\15\0:\6\16\0057\6\17\0:\6\18\0057\6\19\0:\6\20\0057\6\21\0:\6\22\0057\6\23\0:\6\24\0057\6\25\0:\6\26\0057\6\27\0:\6\28\0057\6\29\0:\6\30\0057\6\31\0:\6 \0057\6!\0:\6\"\0051\6#\0:\6$\0057\6%\2:\6&\0057\6'\2:\6(\0057\6)\2:\6*\5:\5+\0043\5,\0003\6-\0:\6.\5:\5/\4>\3\2\0014\3\0\0%\0040\0>\3\2\0027\0031\0033\0043\0003\0052\0:\0054\4>\3\2\0014\0035\0001\0047\0:\0046\0034\0038\0007\0039\3%\4:\0>\3\2\0014\0038\0007\0039\3%\4;\0>\3\2\0014\0038\0007\0039\3%\4<\0>\3\2\0014\0038\0007\0039\3%\4=\0>\3\2\0010\0\0€G\0\1\0\16augroup END.  autocmd Filetype lir :lua LirSettings()\15  autocmd!\25augroup lir-settings\bcmd\bvim\0\16LirSettings\a_G\20lir_folder_icon\1\0\0\1\0\3\ncolor\f#7ebae4\ticon\bî—¿\tname\18LirFolderNode\rset_icon\22nvim-web-devicons\nfloat\18curdir_window\1\0\2\22highlight_dirname\1\venable\1\1\0\1\rwinblend\3\1\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\6l\t<CR>\1\0\0\tedit\1\0\3\16hide_cursor\2\22show_hidden_files\1\20devicons_enable\2\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["microcontroller-nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/microcontroller-nvim",
    url = "https://github.com/madskjeldgaard/microcontroller-nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÚ\1\0\1\2\1\a\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€4\1\2\0007\1\3\1>\1\1\2\15\0\1\0T\2\4€4\1\2\0007\1\4\1>\1\1\1T\1\n€4\1\5\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\6\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\rcomplete\21has_words_before\19expand_or_jump\23expand_or_jumpable\fluasnip\21select_next_item\fvisible”\1\0\1\3\1\5\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€4\1\2\0007\1\3\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€4\1\2\0007\1\4\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\tjump\rjumpable\fluasnip\21select_prev_item\fvisible“\16\1\0\t\0R\0´\0014\0\0\0%\1\1\0>\0\2\0021\1\2\0004\2\0\0%\3\3\0>\2\2\0027\3\4\2>\3\1\0017\3\5\0003\4\t\0003\5\a\0001\6\6\0:\6\b\5:\5\n\0043\5\14\0007\6\v\0007\a\v\0007\a\f\a'\büÿ>\a\2\0023\b\r\0>\6\3\2:\6\15\0057\6\v\0007\a\v\0007\a\f\a'\b\4\0>\a\2\0023\b\16\0>\6\3\2:\6\17\0057\6\v\0007\a\v\0007\a\18\a>\a\1\0023\b\19\0>\6\3\2:\6\20\0057\6\21\0007\6\22\6:\6\23\0057\6\v\0003\a\25\0007\b\v\0007\b\24\b>\b\1\2:\b\26\a7\b\v\0007\b\27\b>\b\1\2:\b\28\a>\6\2\2:\6\29\0057\6\v\0007\6\30\0063\a\31\0>\6\2\2:\6 \0057\6\v\0001\a!\0003\b\"\0>\6\3\2:\6#\0057\6\v\0001\a$\0003\b%\0>\6\3\2:\6&\5:\5\v\0047\5\21\0007\5'\0052\6\b\0003\a(\0;\a\1\0063\a)\0;\a\2\0063\a*\0;\a\3\0063\a+\0;\a\4\0063\a,\0;\a\5\0063\a-\0;\a\6\0063\a.\0;\a\a\6>\5\2\2:\5'\0043\0053\0007\6/\0023\a0\0003\b1\0:\b2\a>\6\2\2:\0064\5:\0055\0043\0056\0:\0057\4>\3\2\0014\3\0\0%\0048\0>\3\2\0027\0039\0034\4:\0007\4;\0047\4<\0047\4=\4>\4\1\0=\3\0\0024\4\0\0%\5>\0>\4\2\0027\4?\0047\4\5\0043\5@\0:\3A\5>\4\2\0014\4:\0007\4B\4%\5C\0>\4\2\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6#\0%\aF\0003\bG\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6#\0%\aF\0003\bI\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6&\0%\aJ\0003\bK\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6&\0%\aJ\0003\bL\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6M\0%\aN\0002\b\0\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6M\0%\aN\0002\b\0\0>\4\5\0014\4\0\0%\5O\0>\4\2\0027\4P\4>\4\1\0014\4\0\0%\5Q\0>\4\2\0010\0\0€G\0\1\0\18myLuaSnippets\14lazy_load luasnip/loaders/from_vscode\30<Plug>luasnip-next-choice\n<C-E>\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\20nvim_set_keymap\bapiã\3                imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'\n                inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>\n                imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'\n                snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>\n                snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\17capabilities\1\0\0\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\17experimental\1\0\2\16native_menu\2\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\b\arg\t[rg]\rnvim_lua\n[api]\rnvim_lsp\n[LSP]\ttags\v[tags]\tpath\v[path]\tcalc\v[calc]\vbuffer\n[buf]\fluasnip\v[snip]\1\0\1\14with_text\2\15cmp_format\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\ttags\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\1\0\1\tname\fluasnip\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-l>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\0\bcmp\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2u\0\0\3\0\a\0\f4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\3\0%\1\4\0>\0\2\0027\1\5\0007\1\6\0012\2\0\0>\1\2\1G\0\1\0\nsetup\vclangd\14lspconfig\frequire\27packadd nvim-lspconfig\bcmd\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["osc.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/osc.nvim",
    url = "https://github.com/davidgranstrom/osc.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/depps/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\1\2q\0\1\5\0\a\0\n7\1\0\0%\2\1\0003\3\2\0003\4\3\0:\4\4\3>\1\3\0017\1\5\0%\2\6\0>\1\2\1G\0\1\0\17tag_matching\vpreset\14filetypes\1\2\0\0\18supercollider\1\0\1\nclose\6|\6|\tpair8\1\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0001\1\3\0>\0\2\1G\0\1\0\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/pears.nvim",
    url = "https://github.com/steelsojka/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["reaper-nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\16reaper-nvim\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/reaper-nvim",
    url = "https://github.com/madskjeldgaard/reaper-nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  scnvim = {
    config = { "\27LJ\1\2\3\0\0\2\0\16\0)4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1F\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0'\1\16':\1\b\0004\0\0\0007\0\t\0%\1\v\0:\1\n\0004\0\0\0007\0\t\0'\1\3\0:\1\f\0004\0\0\0007\0\t\0'\1c\0:\1\r\0004\0\0\0007\0\14\0%\1\15\0>\0\2\1G\0\1\0*autocmd filetype scnvim setlocal wrap\bcmd\14foldlevel\16foldnestmax\vindent\15foldmethod\awo\30scnvim_postwin_scrollback\fluasnip\26scnvim_snippet_format\17scnvim_scdoc\24scnvim_postwin_size\31scnvim_postwin_auto_toggle\23scnvim_no_mappings\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/scnvim",
    url = "https://github.com/davidgranstrom/scnvim"
  },
  tabular = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\2Â\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\b\20shade_terminals\2\17open_mapping\n<c-\\>\20insert_mappings\2\19shading_factor\0061\20start_in_insert\2\17persist_size\2\14direction\nfloat\17hide_numbers\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-auto-save"] = {
    config = { "\27LJ\1\2L\0\0\2\0\4\0\t4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\3\0G\0\1\0\21auto_save_silent\14auto_save\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/907th/vim-auto-save"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-glsl",
    url = "https://github.com/tikhomirov/vim-glsl"
  },
  ["vim-lilypond"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-lilypond",
    url = "https://github.com/sersorrel/vim-lilypond"
  },
  ["vim-markdown-folding"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-markdown-folding",
    url = "https://github.com/masukomi/vim-markdown-folding"
  },
  ["vim-processing"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-processing",
    url = "https://github.com/sophacles/vim-processing"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-scdoc-snippets"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-scdoc-snippets",
    url = "https://github.com/madskjeldgaard/vim-scdoc-snippets"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["vim-startify"] = {
    config = { "\27LJ\1\2Ä\4\0\0\6\0\21\00004\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\5\0:\1\3\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0%\1\5\0:\1\6\0004\0\0\0007\0\1\0003\1\b\0:\1\a\0004\0\0\0007\0\1\0002\1\5\0003\2\n\0003\3\v\0:\3\f\2;\2\1\0013\2\r\0003\3\14\0:\3\f\2;\2\2\0013\2\15\0002\3\3\0%\4\16\0004\5\0\0007\5\17\0057\5\18\5>\5\1\2$\4\5\4;\4\1\3:\3\f\2;\2\3\0013\2\19\0003\3\20\0:\3\f\2;\2\4\1:\1\t\0G\0\1\0\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vgetcwd\afn\24   Recent files in \1\0\1\ttype\bdir\1\2\0\0\20   Recent files\1\0\1\ttype\nfiles\vheader\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\19startify_lists\1\4\0\0\28~/.config/nvim/init.lua$~/.config/nvim/lua/settings.lua$~/.config/nvim/lua/mappings.lua\23startify_bookmarks\27startify_custom_footer\5\27startify_custom_header\26startify_files_number!startify_session_persistence\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-table-mode"] = {
    config = { "\27LJ\1\0025\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\6|\22table_mode_corner\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-visual-increment"] = {
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vim-visual-increment",
    url = "https://github.com/triglav/vim-visual-increment"
  },
  vimwiki = {
    config = { "\27LJ\1\2¾\4\0\0\4\0\f\0\0294\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\2\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0002\1\3\0003\2\t\0003\3\n\0:\3\v\2;\2\1\1:\1\b\0G\0\1\0\20nested_syntaxes\1\0\5\blua\blua\18supercollider\18supercollider\tbash\tbash\bzsh\bzsh\bc++\bcpp\1\0\b\21auto_diary_index\3\1\rauto_toc\3\1\vsyntax\rmarkdown\14auto_tags\3\1\bext\n.wiki\tpath\14~/vimwiki\23auto_generate_tags\3\1\17diary_header\16Depps Diary\17vimwiki_list\1\0\f\a10\fOctober\0062\rFebruary\0067\tJuly\0063\nMarch\a12\rDecember\a11\rNovember\0066\tJune\0069\14September\0065\bMay\0061\fJanuary\0068\vAugust\0064\nApril\25vimwiki_diary_months\23vimwiki_global_ext\24vimwiki_conceal_pre\26vimwiki_hl_cb_checked\25vimwiki_use_calendar\6g\bvim\0" },
    loaded = true,
    path = "/home/depps/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2u\0\0\3\0\a\0\f4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\3\0%\1\4\0>\0\2\0027\1\5\0007\1\6\0012\2\0\0>\1\2\1G\0\1\0\nsetup\vclangd\14lspconfig\frequire\27packadd nvim-lspconfig\bcmd\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2›\2\0\0\a\0\v\2+4\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0>\0\3\2\a\0\4\0T\0\2€)\0\1\0H\0\2\0004\0\5\0004\1\0\0007\1\1\0017\1\6\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\0\0007\2\1\0027\2\a\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\b\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\t\2%\4\n\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÚ\1\0\1\2\1\a\0\29+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\19€4\1\2\0007\1\3\1>\1\1\2\15\0\1\0T\2\4€4\1\2\0007\1\4\1>\1\1\1T\1\n€4\1\5\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\6\1>\1\1\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\rcomplete\21has_words_before\19expand_or_jump\23expand_or_jumpable\fluasnip\21select_next_item\fvisible”\1\0\1\3\1\5\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€4\1\2\0007\1\3\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€4\1\2\0007\1\4\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\tjump\rjumpable\fluasnip\21select_prev_item\fvisible“\16\1\0\t\0R\0´\0014\0\0\0%\1\1\0>\0\2\0021\1\2\0004\2\0\0%\3\3\0>\2\2\0027\3\4\2>\3\1\0017\3\5\0003\4\t\0003\5\a\0001\6\6\0:\6\b\5:\5\n\0043\5\14\0007\6\v\0007\a\v\0007\a\f\a'\büÿ>\a\2\0023\b\r\0>\6\3\2:\6\15\0057\6\v\0007\a\v\0007\a\f\a'\b\4\0>\a\2\0023\b\16\0>\6\3\2:\6\17\0057\6\v\0007\a\v\0007\a\18\a>\a\1\0023\b\19\0>\6\3\2:\6\20\0057\6\21\0007\6\22\6:\6\23\0057\6\v\0003\a\25\0007\b\v\0007\b\24\b>\b\1\2:\b\26\a7\b\v\0007\b\27\b>\b\1\2:\b\28\a>\6\2\2:\6\29\0057\6\v\0007\6\30\0063\a\31\0>\6\2\2:\6 \0057\6\v\0001\a!\0003\b\"\0>\6\3\2:\6#\0057\6\v\0001\a$\0003\b%\0>\6\3\2:\6&\5:\5\v\0047\5\21\0007\5'\0052\6\b\0003\a(\0;\a\1\0063\a)\0;\a\2\0063\a*\0;\a\3\0063\a+\0;\a\4\0063\a,\0;\a\5\0063\a-\0;\a\6\0063\a.\0;\a\a\6>\5\2\2:\5'\0043\0053\0007\6/\0023\a0\0003\b1\0:\b2\a>\6\2\2:\0064\5:\0055\0043\0056\0:\0057\4>\3\2\0014\3\0\0%\0048\0>\3\2\0027\0039\0034\4:\0007\4;\0047\4<\0047\4=\4>\4\1\0=\3\0\0024\4\0\0%\5>\0>\4\2\0027\4?\0047\4\5\0043\5@\0:\3A\5>\4\2\0014\4:\0007\4B\4%\5C\0>\4\2\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6#\0%\aF\0003\bG\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6#\0%\aF\0003\bI\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6&\0%\aJ\0003\bK\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6&\0%\aJ\0003\bL\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5\26\0%\6M\0%\aN\0002\b\0\0>\4\5\0014\4:\0007\4D\0047\4E\4%\5H\0%\6M\0%\aN\0002\b\0\0>\4\5\0014\4\0\0%\5O\0>\4\2\0027\4P\4>\4\1\0014\4\0\0%\5Q\0>\4\2\0010\0\0€G\0\1\0\18myLuaSnippets\14lazy_load luasnip/loaders/from_vscode\30<Plug>luasnip-next-choice\n<C-E>\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\20nvim_set_keymap\bapiã\3                imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'\n                inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>\n                imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'\n                snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>\n                snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>\n                \bcmd\17capabilities\1\0\0\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\17experimental\1\0\2\16native_menu\2\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\b\arg\t[rg]\rnvim_lua\n[api]\rnvim_lsp\n[LSP]\ttags\v[tags]\tpath\v[path]\tcalc\v[calc]\vbuffer\n[buf]\fluasnip\v[snip]\1\0\1\14with_text\2\15cmp_format\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\ttags\1\0\1\tname\tpath\1\0\1\tname\tcalc\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\1\0\1\tname\fluasnip\fsources\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-l>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\0\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2J\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\1\0:\1\2\0G\0\1\0-indent_blankline_show_first_indent_level\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\1\2G\0\0\2\1\4\0\b+\0\0\0007\0\0\0>\0\1\0014\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0\1À\14normal! j\bcmd\bvim\16toggle_markü\1\0\0\6\0\f\0\0254\0\0\0007\0\1\0007\0\2\0'\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\0\6\0014\0\0\0007\0\1\0007\0\a\0002\1\3\0003\2\v\0004\3\0\0007\3\b\0037\3\t\3%\4\n\0>\3\2\2;\3\1\2;\2\1\1)\2\1\0002\3\0\0>\0\4\1G\0\1\0\1\3\0\0\0\vNormal\b%:p\vexpand\afn\14nvim_echo\1\0\2\vsilent\2\fnoremap\2=:<C-u>lua require\"lir.mark.actions\".toggle_mark(\"v\")<CR>\6J\6x\24nvim_buf_set_keymap\bapi\bvimŽ\a\1\0\a\0>\0V4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0024\2\0\0%\3\3\0>\2\2\0024\3\0\0%\4\4\0>\3\2\0027\3\5\0033\4\6\0003\5\b\0007\6\a\0:\6\t\0057\6\a\0:\6\n\0057\6\v\0:\6\f\0057\6\r\0:\6\14\0057\6\15\0:\6\16\0057\6\17\0:\6\18\0057\6\19\0:\6\20\0057\6\21\0:\6\22\0057\6\23\0:\6\24\0057\6\25\0:\6\26\0057\6\27\0:\6\28\0057\6\29\0:\6\30\0057\6\31\0:\6 \0057\6!\0:\6\"\0051\6#\0:\6$\0057\6%\2:\6&\0057\6'\2:\6(\0057\6)\2:\6*\5:\5+\0043\5,\0003\6-\0:\6.\5:\5/\4>\3\2\0014\3\0\0%\0040\0>\3\2\0027\0031\0033\0043\0003\0052\0:\0054\4>\3\2\0014\0035\0001\0047\0:\0046\0034\0038\0007\0039\3%\4:\0>\3\2\0014\0038\0007\0039\3%\4;\0>\3\2\0014\0038\0007\0039\3%\4<\0>\3\2\0014\0038\0007\0039\3%\4=\0>\3\2\0010\0\0€G\0\1\0\16augroup END.  autocmd Filetype lir :lua LirSettings()\15  autocmd!\25augroup lir-settings\bcmd\bvim\0\16LirSettings\a_G\20lir_folder_icon\1\0\0\1\0\3\ncolor\f#7ebae4\ticon\bî—¿\tname\18LirFolderNode\rset_icon\22nvim-web-devicons\nfloat\18curdir_window\1\0\2\22highlight_dirname\1\venable\1\1\0\1\rwinblend\3\1\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\6l\t<CR>\1\0\0\tedit\1\0\3\16hide_cursor\2\22show_hidden_files\1\20devicons_enable\2\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19galaxylineconf\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
try_loadstring("\27LJ\1\2š\6\0\0\6\0\28\0\0314\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\n\0003\3\4\0003\4\3\0:\4\5\0033\4\6\0:\4\a\0033\4\b\0:\4\t\3:\3\v\0023\3\19\0003\4\f\0003\5\r\0:\5\14\0043\5\15\0:\5\16\0043\5\17\0:\5\18\4:\4\20\0033\4\21\0:\4\22\3:\3\23\0023\3\24\0:\3\25\0023\3\26\0:\3\27\2>\1\2\1G\0\1\0\tmisc\1\0\3\19cursor_by_mode\1\20on_off_commands\1\25ui_elements_commands\1\17integrations\1\0\3\18vim_gitgutter\2\15galaxyline\2\ttmux\2\nmodes\nfocus\1\0\2\17focus_method\17experimental\20margin_of_error\3\5\rataraxis\1\0\0\22affected_higroups\1\0\a\17StatusLineNC\2\15FoldColumn\2\16ColorColumn\2\15StatusLine\2\14VertSplit\2\15SignColumn\2\fNonText\2\14custom_bg\1\3\0\0\tnone\5\29ideal_writing_area_width\1\2\0\0\3\0\1\0\t\18right_padding\3 \17auto_padding\2\19bottom_padding\3\1\tquit\runtoggle\16top_padding\3\1\17left_padding\3 \21bg_configuration\2 keep_default_fold_fillchars\2\28ignore_floating_windows\2\aui\1\0\0\tleft\1\0\3\15signcolumn\ano\19relativenumber\1\vnumber\1\btop\1\0\1\16showtabline\3\0\vbottom\1\0\0\1\0\5\rshowmode\1\fshowcmd\1\15laststatus\3\0\nruler\1\14cmdheight\3\1\nsetup\rtrue-zen\frequire\0", "config", "TrueZen.nvim")
time([[Config for TrueZen.nvim]], false)
-- Config for: fzf-sc
time([[Config for fzf-sc]], true)
try_loadstring("\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vfzf-sc\frequire\0", "config", "fzf-sc")
time([[Config for fzf-sc]], false)
-- Config for: scnvim
time([[Config for scnvim]], true)
try_loadstring("\27LJ\1\2\3\0\0\2\0\16\0)4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0004\0\0\0007\0\1\0'\1F\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0'\1\16':\1\b\0004\0\0\0007\0\t\0%\1\v\0:\1\n\0004\0\0\0007\0\t\0'\1\3\0:\1\f\0004\0\0\0007\0\t\0'\1c\0:\1\r\0004\0\0\0007\0\14\0%\1\15\0>\0\2\1G\0\1\0*autocmd filetype scnvim setlocal wrap\bcmd\14foldlevel\16foldnestmax\vindent\15foldmethod\awo\30scnvim_postwin_scrollback\fluasnip\26scnvim_snippet_format\17scnvim_scdoc\24scnvim_postwin_size\31scnvim_postwin_auto_toggle\23scnvim_no_mappings\6g\bvim\0", "config", "scnvim")
time([[Config for scnvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\1\2¾\4\0\0\4\0\f\0\0294\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\2\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\0\0:\1\5\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0002\1\3\0003\2\t\0003\3\n\0:\3\v\2;\2\1\1:\1\b\0G\0\1\0\20nested_syntaxes\1\0\5\blua\blua\18supercollider\18supercollider\tbash\tbash\bzsh\bzsh\bc++\bcpp\1\0\b\21auto_diary_index\3\1\rauto_toc\3\1\vsyntax\rmarkdown\14auto_tags\3\1\bext\n.wiki\tpath\14~/vimwiki\23auto_generate_tags\3\1\17diary_header\16Depps Diary\17vimwiki_list\1\0\f\a10\fOctober\0062\rFebruary\0067\tJuly\0063\nMarch\a12\rDecember\a11\rNovember\0066\tJune\0069\14September\0065\bMay\0061\fJanuary\0068\vAugust\0064\nApril\25vimwiki_diary_months\23vimwiki_global_ext\24vimwiki_conceal_pre\26vimwiki_hl_cb_checked\25vimwiki_use_calendar\6g\bvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\1\2Â\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\b\20shade_terminals\2\17open_mapping\n<c-\\>\20insert_mappings\2\19shading_factor\0061\20start_in_insert\2\17persist_size\2\14direction\nfloat\17hide_numbers\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: ack.vim
time([[Config for ack.vim]], true)
try_loadstring("\27LJ\1\2©\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\4\0004\0\0\0007\0\5\0%\1\6\0>\0\2\1G\0\1\0\25cnoreabbrev Ack Ack!\bcmd#ack_use_cword_for_empty_search-rg --vimgrep --type-not sql --smart-case\vackprg\6g\bvim\0", "config", "ack.vim")
time([[Config for ack.vim]], false)
-- Config for: vim-table-mode
time([[Config for vim-table-mode]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\6|\22table_mode_corner\6g\bvim\0", "config", "vim-table-mode")
time([[Config for vim-table-mode]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
try_loadstring("\27LJ\1\2q\0\1\5\0\a\0\n7\1\0\0%\2\1\0003\3\2\0003\4\3\0:\4\4\3>\1\3\0017\1\5\0%\2\6\0>\1\2\1G\0\1\0\17tag_matching\vpreset\14filetypes\1\2\0\0\18supercollider\1\0\1\nclose\6|\6|\tpair8\1\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0001\1\3\0>\0\2\1G\0\1\0\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time([[Config for pears.nvim]], false)
-- Config for: reaper-nvim
time([[Config for reaper-nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\16reaper-nvim\frequire\0", "config", "reaper-nvim")
time([[Config for reaper-nvim]], false)
-- Config for: vim-auto-save
time([[Config for vim-auto-save]], true)
try_loadstring("\27LJ\1\2L\0\0\2\0\4\0\t4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\0\0007\0\1\0)\1\2\0:\1\3\0G\0\1\0\21auto_save_silent\14auto_save\6g\bvim\0", "config", "vim-auto-save")
time([[Config for vim-auto-save]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\1\2Ä\4\0\0\6\0\21\00004\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\5\0:\1\3\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0%\1\5\0:\1\6\0004\0\0\0007\0\1\0003\1\b\0:\1\a\0004\0\0\0007\0\1\0002\1\5\0003\2\n\0003\3\v\0:\3\f\2;\2\1\0013\2\r\0003\3\14\0:\3\f\2;\2\2\0013\2\15\0002\3\3\0%\4\16\0004\5\0\0007\5\17\0057\5\18\5>\5\1\2$\4\5\4;\4\1\3:\3\f\2;\2\3\0013\2\19\0003\3\20\0:\3\f\2;\2\4\1:\1\t\0G\0\1\0\1\2\0\0\17   Bookmarks\1\0\1\ttype\14bookmarks\vgetcwd\afn\24   Recent files in \1\0\1\ttype\bdir\1\2\0\0\20   Recent files\1\0\1\ttype\nfiles\vheader\1\2\0\0\16   Sessions\1\0\1\ttype\rsessions\19startify_lists\1\4\0\0\28~/.config/nvim/init.lua$~/.config/nvim/lua/settings.lua$~/.config/nvim/lua/mappings.lua\23startify_bookmarks\27startify_custom_footer\5\27startify_custom_header\26startify_files_number!startify_session_persistence\6g\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

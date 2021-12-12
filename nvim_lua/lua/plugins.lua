-- Automatically recompile packer when updating this config file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd termdebug]]

return require('packer').startup(
  {
    function()
      -- startup screen
      use {'mhinz/vim-startify', config = function()
             vim.g.startify_session_persistence = 1
             vim.g.startify_files_number = 5
             vim.g.startify_custom_header = ''
             vim.g.startify_custom_footer = ''
             vim.g.startify_bookmarks = {
               '~/.config/nvim/init.lua',
               '~/.config/nvim/lua/settings.lua',
               '~/.config/nvim/lua/mappings.lua',
               -- '~/.config/SuperCollider/startup.scd'
             }

             vim.g.startify_lists = {
               { type = 'sessions',  header = { '   Sessions' }       },
               { type = 'files',     header = { '   Recent files' }},
               { type = 'dir',       header = { '   Recent files in ' .. vim.fn.getcwd() } },
               { type = 'bookmarks', header = { '   Bookmarks' } },
             }
      end}
      -- truezen
      use {
        'Pocco81/TrueZen.nvim', config = function ()
          local true_zen = require("true-zen")

          true_zen.setup({
              ui = {
                bottom = {
                  laststatus = 0,
                  ruler = false,
                  showmode = false,
                  showcmd = false,
                  cmdheight = 1,
                },
                top = {
                  showtabline = 0,
                },
                left = {
                  number = false,
                  relativenumber = false,
                  signcolumn = "no",
                },
              },
              modes = {
                ataraxis = {
                  left_padding = 32,
                  right_padding = 32,
                  top_padding = 1,
                  bottom_padding = 1,
                  ideal_writing_area_width = {0},
                  auto_padding = true,
                  keep_default_fold_fillchars = true,
                  custom_bg = {"none", ""},
                  bg_configuration = true,
                  quit = "untoggle",
                  ignore_floating_windows = true,
                  affected_higroups = {
                    NonText = true,
                    FoldColumn = true,
                    ColorColumn = true,
                    VertSplit = true,
                    StatusLine = true,
                    StatusLineNC = true,
                    SignColumn = true,
                  },
                },
                focus = {
                  margin_of_error = 5,
                  focus_method = "experimental"
                },
              },
              integrations = {
                vim_gitgutter = true,
                galaxyline = true,
                tmux = true,
              },
              misc = {
                on_off_commands = false,
                ui_elements_commands = false,
                cursor_by_mode = false,
              }
          })

        end
      }
      -- toggleterm
      use {
        'akinsho/toggleterm.nvim',
        config = function()
          require'toggleterm'.setup{
            open_mapping = [[<c-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = "1",
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'float',
                                   }
        end
      }
      -- lir
      use {
        'tamago324/lir.nvim',
        requires = { 'tamago324/lir-git-status.nvim' },
        config = function()
          local actions = require'lir.actions'
          local mark_actions = require 'lir.mark.actions'
          local clipboard_actions = require'lir.clipboard.actions'
          require'lir'.setup {
            show_hidden_files = false,
            devicons_enable = true,
            mappings = {
              ['<CR>']  = actions.edit,
              ['l']     = actions.edit,
              ['<C-s>'] = actions.split,
              ['<C-v>'] = actions.vsplit,
              ['<C-t>'] = actions.tabedit,

              ['h']     = actions.up,
              ['q']     = actions.quit,

              ['K']     = actions.mkdir,
              ['N']     = actions.newfile,
              ['R']     = actions.rename,
              ['@']     = actions.cd,
              ['Y']     = actions.yank_path,
              ['.']     = actions.toggle_show_hidden,
              ['D']     = actions.delete,

              ['J'] = function()
                mark_actions.toggle_mark()
                vim.cmd('normal! j')
              end,
              ['C'] = clipboard_actions.copy,
              ['X'] = clipboard_actions.cut,
              ['P'] = clipboard_actions.paste,
            },
            float = {
              winblend = 1,
              curdir_window = {
                enable = false,
                highlight_dirname = false
              },
            },
            hide_cursor = true
                             }
          -- custom folder icon
          require'nvim-web-devicons'.set_icon({
              lir_folder_icon = {
                icon = "",
                color = "#7ebae4",
                name = "LirFolderNode"
              }
                                             })
          -- use visual mode
          function _G.LirSettings()
            vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

            -- echo cwd
            vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
          end

          vim.cmd [[augroup lir-settings]]
          vim.cmd [[  autocmd!]]
          vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
          vim.cmd [[augroup END]]
        end
      }
      use {
        'lewis6991/gitsigns.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function()
          require('gitsigns').setup()
        end
      }
      use "sophacles/vim-processing"
      use 'sersorrel/vim-lilypond'
      use "tversteeg/registers.nvim"
      use 'mattn/calendar-vim'
      use {
        'vimwiki/vimwiki',
        config = function()
          vim.g.vimwiki_use_calendar = 1
          vim.g.vimwiki_hl_cb_checked = 2
          vim.g.vimwiki_conceal_pre = 1
          vim.g.vimwiki_global_ext = 0

          vim.g.vimwiki_diary_months = {
            ['1'] = "January",
            ['2'] = "February",
            ['3'] = "March",
            ['4'] = "April",
            ['5'] = "May",
            ['6'] = "June",
            ['7'] = "July",
            ['8'] = "August",
            ['9'] = "September",
            ['10'] = "October",
            ['11'] = "November",
            ['12'] = "December"
          }

          vim.g.vimwiki_list = {{
              path = "~/vimwiki",
              syntax = "markdown",
              ext = ".wiki",
              diary_header = "Depps Diary",
              auto_toc = 1,
              auto_generate_tags = 1,
              auto_tags = 1,
              auto_diary_index = 1,
              nested_syntaxes = {
                bash = "bash", zsh = "zsh", supercollider="supercollider", ['c++'] = "cpp", lua = "lua",
              }
          }}

        end
      }
      use {
        'dhruvasagar/vim-table-mode',
        config = function()
          vim.g.table_mode_corner = '|'
        end
      }
      use 'madskjeldgaard/microcontroller-nvim'
      use {
        'madskjeldgaard/reaper-nvim',
        config = function()
          require'reaper-nvim'.setup()
        end
      }
      use 'davidgranstrom/osc.nvim'
      use {
        'radenling/vim-dispatch-neovim',
        requires = 'tpope/vim-dispatch',
      }
      use {'wbthomason/packer.nvim', opt = true}
      use {
        'mileszs/ack.vim',
        config = function()
          vim.g.ackprg = 'rg --vimgrep --type-not sql --smart-case'
          vim.g.ack_use_cword_for_empty_search = true
          vim.cmd([[cnoreabbrev Ack Ack!]])
        end
      }
      use 'godlygeek/tabular'
      use {
        '907th/vim-auto-save',
        config = function()
          vim.g.auto_save = true
          vim.g.auto_save_silent = true
        end
      }
      use 'triglav/vim-visual-increment'
      use {
        'cespare/vim-toml',
        branch = "main"
      }
      use 'vim-scripts/a.vim'
      use {
        'davidgranstrom/scnvim',
        -- requires = {
        --   'madskjeldgaard/sc-scratchpad.nvim',
        --   'madskjeldgaard/supercollider-h4x-nvim',
        -- },
        config = function()
          vim.g.scnvim_no_mappings = 1
          vim.g.scnvim_postwin_auto_toggle = 1
          vim.g.scnvim_postwin_size = 70
          vim.g.scnvim_scdoc = 1
          vim.g.scnvim_snippet_format = "luasnip"
          vim.g.scnvim_postwin_scrollback = 10000
          vim.wo.foldmethod = 'indent'
          vim.wo.foldnestmax = 3
          vim.wo.foldlevel = 99
          -- require"sc-scratchpad".setup({
          --     keymaps = {
          --       toggle = "<C-S>",
          --       send = "<C-E>",
          --     },
          --     position = "50%",
          --     width = "50%",
          --     height = "50%",
          --                             })

          vim.cmd[[autocmd filetype scnvim setlocal wrap]]
        end,
      }
      use 'MunifTanjim/nui.nvim'
      use {
        'madskjeldgaard/fzf-sc',
        config = function()
          require'fzf-sc'
        end
      }
      use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
          vim.g.indent_blankline_show_first_indent_level = false
        end
      }
      use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end
      }
      -- use {
      --     'tpope/vim-commentary',
      --     config = function()
      --         vim.cmd([[autocmd FileType c,cpp,glsl,supercollider setlocal commentstring=//%s]])
      --     end
      -- }
      use 'tpope/vim-surround'
      use 'tpope/vim-vinegar'
      use 'tpope/vim-fugitive'
      use 'tpope/vim-repeat'
      use 'masukomi/vim-markdown-folding'
      use 'kana/vim-textobj-entire'
      use 'kana/vim-textobj-user'
      use 'eddyekofo94/gruvbox-flat.nvim'
      -- use 'PotatoesMaster/i3-vim-syntax'
      use 'google/vim-searchindex'
      use 'tikhomirov/vim-glsl'
      use {
        'neovim/nvim-lspconfig',
        config = function()
          vim.cmd [[packadd nvim-lspconfig]]
          local lsp = require'lspconfig'

          -- lsp.bashls.setup{ }
          -- lsp.vimls.setup{ }
          -- lsp.jsonls.setup {
          --     commands = {
          --         Format = {
          --             function()
          --                 vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
          --             end
          --         }
          --     }
          -- }
          -- lsp.sumneko_lua.setup{
          --     cmd = { "/usr/bin/lua-language-server", "-E", "/usr/bin/lua-language-server/main.lua"},
          --     settings = {
          --         Lua = {
          --             runtime = {
          --                 version = 'LuaJIT',
          --                 path = vim.split(package.path, ';'),
          --             },
          --             diagnostics = {
          --                 globals = {
          --                     "vim",
          --                     "use"
          --                 },
          --                 workspace = {
          --                     library = {
          --                         [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          --                         [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          --                     },
          --                 },
          --             }
          --         }
          --     }
          -- }
          lsp.clangd.setup{ }
          -- lsp.yamlls.setup{ }
        end
      }
      use 'nvim-treesitter/nvim-treesitter'
      use {
        'junegunn/fzf',
        dir = '~/.fzf',
        run = './install',
        requires = 'junegunn/fzf.vim'
      }
      use {
        'steelsojka/pears.nvim',
        config = function()
          require 'pears'.setup(function(conf)
              conf.pair("|", {close = "|", filetypes = {"supercollider"}})
              conf.preset "tag_matching"
                               end)
        end
      }
      use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'galaxylineconf' end,
        requires = 'kyazdani42/nvim-web-devicons'
      }
      use {
        'hrsh7th/nvim-cmp',
        config = function()
          local cmp = require'cmp'

          local has_any_words_before = function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
              return false
            end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
          end

          local lspkind = require'lspkind'
          lspkind.init()

          cmp.setup {
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
              ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
              ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
              ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
              ['<C-e>'] = cmp.mapping({
                  i = cmp.mapping.abort(),
                  c = cmp.mapping.close(),
              }),
              ['<C-l>'] = cmp.mapping.confirm({
                  -- behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
              }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  elseif has_words_before() then
                    cmp.complete()
                  else
                    fallback()
                  end
              end, { "i", "s" }),

              ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
              end, { "i", "s" }),
            },
            sources = cmp.config.sources({
                { name = 'luasnip' },
                -- { name = 'ultisnips'},
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                -- { name = 'rg' },
                { name = 'calc'},
                { name = 'path' },
                { name = 'tags' },
                { name = 'buffer', keyword_length = 5 },

            }),
            formatting = {
              format = lspkind.cmp_format {
                with_text = true,
                menu = {
                  luasnip = "[snip]",
                  -- ultisnips = "[snip]",
                  nvim_lsp = "[LSP]",
                  nvim_lua = "[api]",
                  calc = "[calc]",
                  rg = "[rg]",
                  path = "[path]",
                  tags = "[tags]",
                  buffer = "[buf]",
                },
              },
            },
            experimental = {
              native_menu = true,
              ghost_text = true
            },
          }

          -- Setup lspconfig.
          local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
          require('lspconfig')['clangd'].setup {
            capabilities = capabilities
                                               }

          vim.cmd [[
                imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
                inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
                imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
                snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
                snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
                ]]

                vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
                vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
                vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

                require("luasnip/loaders/from_vscode").lazy_load()
                require'myLuaSnippets'


        end,
        requires = {
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lua',
          'hrsh7th/cmp-nvim-lsp',
          'L3MON4D3/LuaSnip',
          'f3fora/cmp-spell',
          'quangnguyen30192/cmp-nvim-tags',
          'onsails/lspkind-nvim',
          'saadparwaiz1/cmp_luasnip',
          'quangnguyen30192/cmp-nvim-ultisnips',
          'lukas-reineke/cmp-rg',
          'hrsh7th/cmp-calc',
          'rafamadriz/friendly-snippets',
          'madskjeldgaard/vim-scdoc-snippets'
        }
      }
    end,
    config = {
      max_jobs = 16,
      -- git = {
      --     default_url_format = 'https://hub.fastgit.org/%s'
      -- },
      display = {
        open_fn = require'packer.util'.float
      }
    }
  }
                                )

require 'plugins'
-- require 'snippets'
require 'mappings'.mappings()
require 'settings'.settings()
require 'treesitter'.setup()

vim.cmd([[source ~/.config/nvim/abbreviations.vimrc]])
vim.cmd([[source ~/.config/nvim/autocommands.vimrc]])

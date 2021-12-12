local M = {}
local opt = vim.opt
local g = vim.g

function M.settings()
    M.options()
    M.window_options()
    M.netrw()
    M.colorscheme()
end

function M.options()

    opt.autowriteall   = true
    opt.breakindentopt = 'shift:1'
    opt.clipboard      = 'unnamedplus'
    opt.cmdheight      = 1
    opt.compatible     = false
    opt.completeopt    = 'menu,menuone,noselect'
    -- opt.completeopt    = 'menuone,noinsert,noselect'
    opt.diffopt        = 'filler,internal,algorithm:histogram,indent-heuristic'
    opt.encoding       = 'utf-8'
    opt.expandtab      = true
    opt.fillchars      = 'eob: '
    opt.formatprg      = 'fmt'
    opt.formatoptions  = 'jcroql'
    opt.gdefault       = true
    opt.history        = 200
    opt.hlsearch       = true
    opt.inccommand     = "split"
    opt.incsearch      = true
    opt.infercase      = true
    opt.joinspaces     = false
    opt.laststatus     = 2
    -- opt.path:append {"~/sc" }
    opt.shiftwidth     = 4
    opt.showbreak      = '↳'
    opt.smartcase      = true
    opt.smarttab       = true
    opt.softtabstop    = 0
    opt.tabstop        = 4
    opt.splitright     = true
    opt.termguicolors  = true
    opt.textwidth      = 0
    opt.title          = true
    opt.undofile       = true
    opt.wildmode       = "full"
    opt.shortmess:append { c = true }
    opt.background     = "dark"
    -- g.colors_name      = "base16-gruvbox-dark-hard"
    opt.relativenumber = true
end

function M.window_options()
    opt.breakindent = true
    opt.linebreak   = true
    opt.number      = true
    opt.wrap        = true
end

function M.netrw()
    g.netrw_liststyle = 3
    g.netrw_banner    = 0
    g.netrw_winsize   = 25
end

function M.highlight()
    vim.highlight.on_yank{higroup="IncSearch", timeout=500}
end

-- function M.scnvim()
--     opt.wrap = true
-- end

-- function M.mail()
--     opt.formatoptions = 'jrocql'
-- end

function M.term_settings()
    vim.api.nvim_command("startinsert")
end

function M.web()
    opt.tabstop     = 2
    opt.shiftwidth  = 2
    opt.softtabstop = 2
end

function M.markdown()
    opt.foldlevel    = 0
    opt.conceallevel = 0
    opt.syntax = "markdown"
end

function M.glsl()
    opt.commentstring = '//%s'
end

function M.colorscheme()
    g.colors_name="gruvbox-flat"
    g.gruvbox_flat_style = "hard"
    g.gruvbox_theme = { TabLineSel = { bg = "orange" } }
    g.gruvbox_sidebars = { "netrw", "terminal", "toggleterm", "packer", "scnvim"}
    g.gruvbox_colors = { hint = "orange", error = "#ff0000" }
    -- g.gruvbox_transparent = true
    g.gruvbox_italic_functions = true
    vim.cmd([[colorscheme gruvbox-flat]])
end

return M

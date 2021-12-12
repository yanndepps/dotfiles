local gl = require('galaxyline')
local gls = gl.section
-- local Color, colors, Group, groups, styles = require('colorbuddy').setup()

gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
    bg = '#32302f',
    white = '#fbf1c7',
    yellow = '#d79921',
    cyan = '#008080',
    grey = '#928374',
    green = '#98971a',
    purple = '#b16286',
    orange = '#d65d0e',
    blue = '#458588',
    red = '#cc241d'
}

local empty_buffer = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
    return false
end

-- local checkwidth = function()
-- 	local squeeze_width  = vim.fn.winwidth(0) / 2
-- 	if squeeze_width > 40 then
-- 		return true
-- 	end
-- 	return false
-- end

-- Custom file icon for atypical file types
local my_icons = require('galaxyline.provider_fileinfo').define_file_icon() -- get file icon color

-- scnvim:
my_icons['supercollider'] = { colors.blue, "✹" }
my_icons['help.supercollider'] = { colors.orange, "✹" }
my_icons['scnvim'] = { colors.yellow, "✹" }

-- Arch linux
my_icons['PKGBUILD'] = { colors.red, "☡"}

gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = '  ☉ ',
                i = '  ✎ ',
                c = '  ⌨ ',
                v = '  ✄ ',
                [''] = '  ✄ ',
                t = '  ▧ '
            }

            local mode_color = {
                n = colors.blue,
                i = colors.orange,
                c = colors.yellow,
                v = colors.cyan,
                [''] = colors.cyan,
                t = colors.purple
            }

            -- Text for mode
            local current_mode = alias[vim.fn.mode()]

            -- Get color for mode
            local current_bg = mode_color[vim.fn.mode()]
            local current_fg = colors.white

            -- Set color
            vim.cmd(string.format('hi GalaxyViMode guibg=%s guifg=%s', current_bg, current_fg))

            return current_mode
        end,
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.white,colors.green,'bold'},
    },
}

gls.left[2] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = empty_buffer,
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg},
    },
}

gls.left[3] = {
    FileName = {
        provider = {'FileName'},
        condition = empty_buffer,
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},

        -- separator_highlight = {colors.purple,colors.blue},
        highlight = {colors.yellow, colors.bg}
    }
}

gls.left[4] = {
    GitBranch = {
        provider = {'GitBranch', 'DiffAdd'},
        condition = empty_buffer,
        icon = '  ',
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.orange, colors.bg},
    }
}

gls.left[5] = {
    Scnvim = {
        provider = function()
            local scstatus = vim.api.nvim_call_function("scnvim#statusline#server_status", {})
            return scstatus
        end,
        condition = function()
            if vim.api.nvim_get_option("filetype") == "supercollider" then
                return true
            else
                return false
            end
        end,
        icon = ' 📡 ',
        separator = '',
        separator_highlight = {colors.blue, colors.bg},
        highlight = {colors.blue, colors.bg},
    }
}

gls.left[6] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
    }
}

gls.left[7] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.blue,colors.bg},
    }
}

-- CMake
-- gls.left[8] = {
-- 	CMake = {
-- 		provider = function()
-- 			-- if vim.api.nvim_get_option("filetype") == "cpp" then
-- 				local status = vim.fn["cmake#statusline#GetBuildInfo"](0)
-- 				return status
-- 			-- end
-- 		end,
-- 		icon = '',
-- 		highlight = {colors.grey, colors.bg},

-- 	}
-- }

-- Treesitter
-- gls.left[9] = {
-- 	TreeSitter = {
-- 		provider = function()
-- 				local status = vim.fn["nvim_treesitter#statusline"](90)
-- 				return status
-- 		end,
-- 		icon = '',
-- 		highlight = {colors.grey, colors.bg},

-- 	}
-- }

-- gls.left[8] = {
--   VistaPlugin = {
-- 		provider = "VistaPlugin",
-- 		icon = '',
-- 		highlight = {colors.orange,colors.bg},
--   }
-- }
-- gls.left[6] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.blue,colors.bg},
--   }
-- }

-- gls.left[7] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.bg}
--   }
-- }

gls.right[1] = {
    Cwd = {
        provider = function()
            -- return vim.call("getcwd")
            return vim.call("expand", "%")

        end,
        icon = ' ⎙ ',
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[2] = {
    FileType = {
        provider = function()
            return vim.api.nvim_get_option("filetype")
        end,
        -- condition = empty_buffer,
        separator = ' ',
        icon = ' ⌨ ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.grey, colors.bg},
    },
}

gls.right[3] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.grey,colors.bg},
    },
}

gls.right[4] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.yellow, colors.bg},
    }
}

gls.right[5] = {
    ScrollBar = {
        provider = 'ScrollBar',
        separator = ' ',
        separator_highlight = {colors.bg, colors.bg},
        highlight = {colors.yellow,colors.purple},
    }
}

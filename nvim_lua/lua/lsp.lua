local lsp = require'lspconfig'
local M = {}

function M.setup()
    lsp.bashls.setup{}
    lsp.sumneko_lua.setup{
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim",
                        "use"
                    }
                }
            },
        }
    }
    lsp.ccls.setup{}
end

return M

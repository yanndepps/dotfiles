" autocmd BufWritePost plugins.lua PackerCompile

augroup pluginsettings
    autocmd!

    autocmd BufWritePost plugins.lua PackerCompile

    autocmd TextYankPost * silent! lua require 'settings'.highlight()

    autocmd TermOpen * lua require 'settings'.term_settings()

    autocmd FileType markdown lua require 'settings'.markdown()

    autocmd FileType supercollider lua require 'mappings'.supercollider()
    autocmd FileType supercollider lua require 'scnvim_extra'.init()
    " autocmd FileType scnvim lua require 'settings'.scnvim()
    autocmd VimLeavePre *.scd,*.sc call scnvim#sclang#send_silent('SerialPort.closeAll;')

    autocmd FileType c,cpp,lua,rust,html,css,sh,vim lua require 'mappings'.lsp()
    autocmd FileType c,cpp set makeprg=make\ -j$(nproc)
    " autocmd FileType cpp,c,arduino,dosini lua require'microcontroller'.setup()

    autocmd FileType html,json,css lua require 'settings'.web()

augroup end

" augroup lir-settings
"     autocmd!
"     autocmd FileType lir :lua LirSettings()
" augroup end

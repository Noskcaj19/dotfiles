" Always show tabline
set laststatus=2
set showtabline=2

" Dont show mode in vim
set noshowmode

" Lightline buffer settings
let g:lightline_buffer_show_bufnr = 0
let g:lightline_buffer_modified_icon = '+'

" Ale lightline settings
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_ok = ''


let g:lightline = {}
let g:lightline.colorscheme = g:lightline_colorscheme

" Tabline
let g:lightline.tabline = {}
let g:lightline.tabline.left = [ [ 'bufferbefore', 'buffercurrent', 'bufferafter' ] ]
let g:lightline.tabline.right = [ [ 'linter_errors', 'linter_warnings', 'linter_ok' ] ]

" Status line (bottom)
let g:lightline.active = {}
let g:lightline.active.left = [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ]
let g:lightline.active.right = [ [ 'lineinfo' ], ['percent'], [ 'encoding' ] ]

" Component Expand
let g:lightline.component_expand = {}
" Lightline buffer
let g:lightline.component_expand.buffercurrent = "lightline#buffer#buffercurrent"
let g:lightline.component_expand.bufferbefore = "lightline#buffer#bufferbefore"
let g:lightline.component_expand.bufferafter = "lightline#buffer#bufferafter"
" Lightline ALE
let g:lightline.component_expand.linter_warnings = "lightline#ale#warnings"
let g:lightline.component_expand.linter_errors = "lightline#ale#errors"
let g:lightline.component_expand.linter_ok = "lightline#ale#ok"

" Component Types
let g:lightline.component_type = {}
" Lightline buffer
let g:lightline.component_type.buffercurrent = "tabsel"
let g:lightline.component_type.bufferbefore = "raw"
let g:lightline.component_type.bufferafter = "raw"
" Lightline ALE
let g:lightline.component_type.linter_warnings = "warning"
let g:lightline.component_type.linter_errors = "error"
let g:lightline.component_type.linter_ok = "left"

" Component Visibility
let g:lightline.component_visible_condition = {}
let g:lightline.component_visible_condition.readonly = '(&filetype!="help"&& &readonly)'
let g:lightline.component_visible_condition.modified = '(&filetype!="help"&&(&modified||!&modifiable))'
" let g:lightline.component_visible_condition.fugitive = '(exists("*fugitive#head") && ""!=fugitive#head())'

" Components
let g:lightline.component = {}
let g:lightline.component.paste = '%{&paste==1?"\uf0ea":""}'
let g:lightline.component.readonly = '%{&filetype=="help"?"":&readonly?"\uf023":""}'
let g:lightline.component.modified = '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
let g:lightline.component.encoding = '%{&fileencoding=="utf-8"?"":&fileencoding}'
" let g:lightline.component.fugitive = '%{exists("*fugitive#head")?fugitive#head():""}'

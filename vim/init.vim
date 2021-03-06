let g:nvim_config_path = expand('<sfile>:p:h')

let &rtp .= ',' . g:nvim_config_path
if !isdirectory(g:nvim_config_path . "/plugins")
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To be safe
set nocompatible

" Load vim-plug plugins
runtime plugs.vim

exec "source" g:nvim_config_path . '/preconfig.vim'

" Load configs
for fpath in split(globpath(g:nvim_config_path . '/configs', '*.vim'), '\n')
   exe 'source' fpath
endfor

exec "source" g:nvim_config_path . '/postconfig.vim'

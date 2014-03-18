" Vim plugin for running reek on ruby source files
"
" Author:   Louis A. Dunne <louisadunne@gmail.com>
" License:  GPLv2
" URL:      https://github.com/lad/vim-rubocop
"
" grep-prog idea from Vincent Driessen original pep8 plugin

if !hlexists('GreenBar')
  hi GreenBar term=reverse ctermfg=white ctermbg=darkgreen guifg=white guibg=darkgreen
endif

let s:THIS_FILE = 0
let s:ALL_FILES = 1

function! s:Reek(arg)
  set lazyredraw
  cclose

  let l:grepformat = &grepformat
  let l:grepprg = &grepprg
  set grepformat&vim
  let &grepformat = '%f:%l:\ %m'
  let &grepprg = 'reek -s'
  if exists('g:reek_config')
    let &grepprg = &grepprg . ' --config ' . g:reek_config
  endif

  if a:arg == s:THIS_FILE
    silent! grep! %
  else
    silent! grep! .
  endif

  let &grepformat = l:grepformat
  let &grepprg = l:grepprg

  let l:qflist=getqflist()
  if empty(l:qflist)
    set nolazyredraw
    redraw!
    echohl GreenBar
    echomsg "Correct!"
    echohl None
  else
    execute 'belowright copen ' . max([float2nr(winheight(0) * 0.25), 4])
    set nolazyredraw
    redraw!
  endif
endfunction

command! ReekThis      call s:Reek(s:THIS_FILE)
command! ReekAll       call s:Reek(s:ALL_FILES)

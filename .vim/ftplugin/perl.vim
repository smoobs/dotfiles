" perl.vim

setlocal shiftround
setlocal expandtab
setlocal textwidth=72

setlocal cindent
setlocal comments=:#
setlocal cinkeys-=0#
setlocal keywordprg=perldoc
setlocal iskeyword+=:
setlocal tags=./tags,./perltags,tags,perltags,~/.vim/perltags
 
if executable('ack')
  setlocal grepprg=ack\ --type=perl
endif

function! s:look_up(file, depth)
  let l:up = []
  while len(l:up) < a:depth
    let l:name = join(l:up + [a:file], '/')
    if filereadable(l:name)
      return l:name
    endif
    let l:up = l:up + ['..']
  endwhile
  return ''
endfunction

function! s:tidy()
  let l:window = ( line('w0') + line('w$') ) / 2
  let l:line = line('.')
  let l:col  = col('.')
  let l:rc   = s:look_up('.perltidyrc', 5)
  if len(l:rc)
    let l:tidy = ':%!perltidy -pro=' . l:rc
  else
    let l:tidy = ':%!perltidy'
  endif
  exec l:tidy
  exec 'normal ' . l:window . 'zz'
  exec 'normal ' . l:line   . 'G'
  exec 'normal ' . l:col    . '|'
endfunction

noremap <buffer> <f2> :call <SID>tidy()<CR>

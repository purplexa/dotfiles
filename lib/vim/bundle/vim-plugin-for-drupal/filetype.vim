" Check PHP, Javascript, and info files to see if they belong to Drupal.

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  execute 'autocmd BufRead,BufNewFile *.{' . drupaldetect#php_ext . '}'
	\ . ' call s:DrupalDetect("php")'
  autocmd BufRead,BufNewFile *.css call s:DrupalDetect('css')
  autocmd BufRead,BufNewFile *.sass call s:DrupalDetect('sass')
  autocmd BufRead,BufNewFile *.scss call s:DrupalDetect('scss')
  autocmd BufRead,BufNewFile *.js call s:DrupalDetect('javascript')
  autocmd BufRead,BufNewFile *.{info,make,build} call s:DrupalDetect('drini')
augroup END

" @function! s:DrupalDetect(type) " {{{
" If the current buffer appears to be part of Drupal, then set 'filetype' to
" {type}.drupal.
function! s:DrupalDetect(type) " {{{
  " Expect something like /var/www/drupal-7.9/sites/all/modules/ctools
  let directory = expand('%:p:h')
  let drupal_root = drupaldetect#DrupalRoot(directory)
  let info_path = drupaldetect#InfoPath(directory)
  let core = drupaldetect#CoreVersion(info_path)
  if strlen(drupal_root) || strlen(core)
    execute 'setf ' . a:type . '.drupal'
  endif
endfun " }}} }}}

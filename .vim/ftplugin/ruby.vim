set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" vim-ruby-xmpfilter (seeing_is_believing) configuration
let g:xmpfilter_cmd = "seeing_is_believing"

nmap <buffer> <D-m> <Plug>(seeing_is_believing-mark)
xmap <buffer> <D-m> <Plug>(seeing_is_believing-mark)
imap <buffer> <D-m> <Plug>(seeing_is_believing-mark)

nmap <buffer> <D-c> <Plug>(seeing_is_believing-clean)
xmap <buffer> <D-c> <Plug>(seeing_is_believing-clean)
imap <buffer> <D-c> <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
nmap <buffer> <D-r> <Plug>(seeing_is_believing-run_-x)
xmap <buffer> <D-r> <Plug>(seeing_is_believing-run_-x)
imap <buffer> <D-r> <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
nmap <buffer> <F5> <Plug>(seeing_is_believing-run)
xmap <buffer> <F5> <Plug>(seeing_is_believing-run)
imap <buffer> <F5> <Plug>(seeing_is_believing-run)

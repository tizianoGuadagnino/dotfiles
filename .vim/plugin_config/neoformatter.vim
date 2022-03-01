" neoformat
let g:neoformat_python_docformatter = {
            \ 'exe': 'docformatter',
            \ 'args': ['-', '--wrap-summaries 100', '--wrap-descriptions 90'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_python = ['black', 'docformatter']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_try_formatprg = 1
let g:shfmt_opt="-ci"
let g:neoformat_run_all_formatters = 1
augroup filetype_python
    autocmd!
    autocmd FileType python let b:neoformat_run_all_formatters = 1
augroup END

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let maplocalleader ="\<space>"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 2
nmap <leader>tc :VimtexTocOpen<CR>
nmap <leader>cw :VimtexCountWords<CR>
nmap <leader>cl :VimtexCountLetters<CR>
" Vimtex text object
" text-objects:
  " ae … LaTeX environments (e.g. \begin{itemize})
  " ac … commands
  " i$ … inline math structure
  " a$ … whole math structure
" motions and mappings:
  " [[|]] … move to next/previous section
  " % … move between matching delimeters
  " dse|cse … delete/change the surrounding environment
  " dsc|csc … delete/change the surrounding command



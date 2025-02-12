" vim:tw=0:ts=2:sw=2:et:norl:ft=vim
" Author: Landon Bouma <https://tallybark.com/>
" Project: https://github.com/DepoXy/vim-depoxy#🤙
" License: https://creativecommons.org/publicdomain/zero/1.0/
"   Copyright © 2023 Landon Bouma.
" Summary: vim-fugitive `gb` and `gc` maps to show and hide blame.

" -------------------------------------------------------------------

" GUARD: Press <F9> to reload this plugin (or :source it).
" - Via: https://github.com/embrace-vim/vim-source-reloader#↩️

if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_vim_depoxy_fugitive_config
endif

if exists('g:loaded_vim_depoxy_fugitive_config') || &cp

  finish
endif

let g:loaded_vim_depoxy_fugitive_config = 1

" -------------------------------------------------------------------

" vim-fugitive maps 'gq' (Git quit) that closes the :Git blame window.
" - But 'gq' *only* closes the blame window, and not the commit window,
"   if you opened that.
" - And 'gq' *only* works from the blame window.
"
" - We'll add <Leader>fc (mnemonic: Fugitive Close) that closes all
"   vim-fugitive windows, and it works from any window/buffer, and
"   also from Insert mode.
"
" Note that vim-fugitive defines 'gc' that works from the commit window
" (ft=git) and loads a new window and buffer with the changes from the
" revision that introduced the change.
" - The 'gc' map is also at 'gC' (dunno why).
"
" - CXREF: Within a DepoXy environment at:
"   ~/.kit/nvim/tpope/start/vim-fugitive/autoload/fugitive.vim @ 7950
"
"     call s:Map('n', 'gC', “:<C-U>exe 'Gpedit ' .
"       <SID>fnameescape(<SID>ContainingCommit())<CR>”, '<silent>')
"     call s:Map('n', 'gc', “:<C-U>exe 'Gpedit ' .
"       <SID>fnameescape(<SID>ContainingCommit())<CR>”, '<silent>')
"
" - Oddly, neither option appears documented:
"
"   ~/.kit/nvim/tpope/start/vim-fugitive/doc/fugitive.txt
"
" - This plugin used to appropriate 'gc' for the global close-all-fugtive-
"   windows command (now at <Leader>fc).
"
"   - But because NeoVim maps comment/uncomment to 'gcc', if we were to
"     use 'gc', there'd be a second or so delay until Vim runs the 'gc'
"     command (waiting to see if user might run 'gcc' instead).
"
"   - HSTRY/2025-02-12: Comment from years ago:
"
"     - Also, the author cannot quite figure out what they're suppose to do.
"       If I run :Git blame and jump back to the source file, 'gc'/'gC' from
"       *any* line opens the *same* commit window, and it's on a commit from
"       last year, like, 40 commits ago. So I'm not even sure what 'gc'/'gC'
"       are suppose to do. So another way to put it: We're stomping on 'gc',
"       but we doubt you'll miss it. But note I am not a vim-fugitive power-
"       user. I use :Git blame, but all other Git work I do with tig-newtons.

" ***

" vim-fugitive buffer specs:
"
" - Git blame buffer is named, e.g., '353.fugitiveblame',
"   and has filetype=fugitiveblame
"
" - Git commit buffer is named, e.g., 'fugitive:///path/to/project/.git/<sha>,
"   and has filetype=git
"
" - Git show buffer is named, e.g.,
"   'fugitive:///path/to/project/.git//<sha>/proj/path/to/<source-file-basename>'
"   and has filetype= whatever source file is.

" ***

" USAGE/2023-05-21:
"
" - Open blame window with `<Leader>fb`.
"
"   - Mnemonic: Fugitive Blame
"
" - Press `o` on any blame line to open commit.
"
" - Use `<Leader>fc` to closes all fugitive windows.
"
"   - Mnemonic: Fugitive Close
"
" SAVVY/2025-02-12: \fb and \fc are the first (n)vim-depoxy <leader>f bindings.

nnoremap <silent> <leader>fc :call git_fugitive_window_cleanup#close_git_windows()<CR>
inoremap <silent> <leader>fc <C-o>:call git_fugitive_window_cleanup#close_git_windows()<CR>

nnoremap <silent> <leader>fb :Git blame<CR>
inoremap <silent> <leader>fb <C-o>:Git blame<CR>


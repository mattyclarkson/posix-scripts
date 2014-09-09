" Set line limit to 80 characters
set textwidth=80

" Set automatic wrapping to be on for comments and text.  Also enabled
" autoformatting using gq (gggqG) and automatic paragraph formatting
set formatoptions=cqta

" Do NOT wrap depending on terminal size
set wrapmargin=0

" Highlight certain bad things in the file
augroup Highlighters
    " Highlight any characters over 80 characters
    autocmd BufEnter * highlight OverLength ctermbg=gray guibg=#592929
    autocmd BufEnter * match OverLength /\%81v.*/
augroup END

" Remap jj to escape in insert mode.
inoremap jj <Esc>

" Line Numbers PWN!
set number

" Match braces
set showmatch

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Automatically change to the open files directory
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) >
            \         foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" Necessary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command
set showcmd

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
 set expandtab
 set smarttab

" 2 character tab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Always use UTF8 without BOM
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nobomb


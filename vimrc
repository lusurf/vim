set history=1000
filetype plugin on
filetype indent on
set autoread

set ruler
"set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell

syntax enable
set gfn=Monospace\ 10
set shell=/bin/bash
colorscheme zellner
set background=dark
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

" Files, backups and undo
set nobackup
set nowb
set noswapfile

" Text, tab and indent related
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set autoindent
set smartindent
set wrap


" Visual mode related
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
call pathogen#infect()
"config for Taglist
map <F3> :silent! Tlist<CR> "
let Tlist_Ctags_cmd='ctags'
"let Tlist_Use_right_window=1
let Tlist_show_One_File=0
let Tlist_File_fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=0
"let Tlist_Inc_Winwidth=0
"map <F12> :call Do_CsTag()<CR>
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"function Do_CsTag()
"    let dir = getcwd()
"    if filereadable("tags")
"        if(g:iswindows==1)
"            let tagsdeleted=delete(dir."\\"."tags")
"        else
"            let tagsdeleted=delete("./"."tags")
"        endif
"        if(tagsdeleted!=0)
"            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
"            return
"        endif
"    endif
"    if has("cscope")
"        silent! execute "cs kill -1"
"    endif
"    if filereadable("cscope.files")
"        if(g:iswindows==1)
"            let csfilesdeleted=delete(dir."\\"."cscope.files")
"        else
"            let csfilesdeleted=delete("./"."cscope.files")
"        endif
"        if(csfilesdeleted!=0)
"            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
"            return
"        endif
"    endif
"    if filereadable("cscope.out")
"        if(g:iswindows==1)
"            let csoutdeleted=delete(dir."\\"."cscope.out")
"        else
"            let csoutdeleted=delete("./"."cscope.out")
"        endif
"        if(csoutdeleted!=0)
"            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
"            return
"        endif
"    endif
"    if(executable('ctags'))
"        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
"        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
"    endif
"    if(executable('cscope') && has("cscope") )
"        if(g:iswindows!=1)
"            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
"        else
"            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"        endif
"        silent! execute "!cscope -b"
"        execute "normal :"
"        if filereadable("cscope.out")
"            execute "cs add cscope.out"
"        endif
"    endif
"endfunction
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="htlv"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
map <c-h> ,c<space>

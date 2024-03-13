setlocal shiftwidth=2 softtabstop=2 expandtab smarttab
" 替换 <++> ,并继续输入，没有限制
inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
inoremap <buffer> <c-e> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" 消除 <++>, 并换行,只能找其当行之后的
inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
inoremap <buffer> ,n ---<Enter><Enter>
inoremap <buffer> ,b **** <++><Esc>F*hi
inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
inoremap <buffer> ,i ** <++><Esc>F*i
inoremap <buffer> ,d `` <++><Esc>F`i
inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap <buffer> ,t - [ ] 
inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
inoremap <buffer> ,a [](<++>) <++><Esc>F[a
inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA
inoremap <buffer> ,l --------<Enter>
inoremap <buffer> ,M $$<Enter><++><Enter>$$<Enter><Enter><++><Esc>4kA
inoremap <buffer> ,m $$ <++><Esc>F$i
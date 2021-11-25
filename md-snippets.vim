"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)

" 替换 <++> ,并继续输入，没有限制
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
" 消除 <++>, 并换行,只能找其当行之后的
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>

autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter> "细线 分隔线 适用于标题
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>   "粗线 分隔线 适用于段落

autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i

autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

autocmd Filetype markdown inoremap <buffer> ,t - [ ] 

autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a

autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,6 ######<Space><Enter><++><Esc>kA

" math
autocmd Filetype markdown inoremap <buffer> ,M $$<Enter><++><Enter>$$<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m $$ <++><Esc>F$i

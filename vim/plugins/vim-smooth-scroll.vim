
" vim-smooth-scroll provides animated scrolling.
"
" Function parameters:
" 1) Lines to scroll
" 2) Duration per animation frame (milliseconds)
" 3) Number of lines to scroll per animation frame

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 7, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 7, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 7, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 7, 4)<CR>

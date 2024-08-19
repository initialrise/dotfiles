set nu
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'rightbelow new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	exec buffercmd
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

let mapleader=" "
command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 %s && a.exe', expand('%')))
autocmd FileType c nnoremap <leader>fj :w<CR> \| :CompileAndRun<CR> 

command! -nargs=0 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && a.exe < inp', expand('%')))
autocmd FileType c nnoremap <F6> :CompileAndRunWithFile<CR>


let g:split_term_style = 'horizontal'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
let g:split_term_resize_cmd = 'resize 10'
" (or let g:split_term_resize_cmd = 'vertical resize 40')
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark

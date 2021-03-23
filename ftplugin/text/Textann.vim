" --------------------------------
" Add our plugin to the path
" --------------------------------
"python import sys
"python import vim
"python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
"check if variable is defined
if exists('g:labels') == 0
	let g:labels = {"[S]ender":'S',	"[A]ttribute":"A", "[R]]cipient":"R", "S[u]bject":"U", 	"[T]P": "T"}  

endif    

func MyMenuFilter(id, key)
      
          " Handle shortcuts
	  let idx = 1
	  for v in values(g:labels)
		if v == a:key
		    call popup_close(a:id,idx)
		    return 1  
		 endif
	    let idx += 1      
	    endfor  
        

          " No shortcut, pass to generic filter
          return popup_filter_menu(a:id, a:key)
endfunc     


function! WrapTag(tag)
	let tag = a:tag
	if len(tag) > 0
		normal `>
		if &selection == 'exclusive'
			exe "normal i</".tag.">"
		else
			exe "normal a</".tag.">"
		endif
		normal `<
		exe "normal i<".tag.">"
		normal `<
	else
		normal `>
		if &selection == 'exclusive'
			exe "normal i\]\]"
		else
			exe "normal a\]\]"
		endif
		normal `<
		exe "normal i\[\["
		normal `<

	endif	
endfunc  
 

function! MenuCB(id, result)
py3 << endPython
import vim

r = vim.eval("a:result")

labels = vim.eval("g:labels")


if int(r)-1 < len(labels):
   tag = list(labels.values())[int(r)-1]    
   vim.command("call WrapTag('"+tag+"')")   

endPython
endfunction         





function! GetRange() range
py3 << endPython
import vim

vim.command("call WrapTag('')")

endPython
endfunction

function! GetPramaters() range
py3 << endPython
import vim
labels = vim.eval("g:labels")    
str_labels =",".join("'{0}'".format(w) for w in list(labels.keys()))
vim.command("call popup_menu(["+str_labels+"],#{filter: 'MyMenuFilter', callback:'MenuCB',})")

endPython
endfunction      

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! -range Range call GetRange()
command! -range Params call GetPramaters()  


py3 << endPython
import vim

def get_visual_selection():
    buf = vim.current.buffer
    (starting_line_num, col1) = buf.mark('<')
    (ending_line_num, col2) = buf.mark('>')
    lines = vim.eval('getline({}, {})'.format(starting_line_num, ending_line_num))
    #print(lines, col1, col2)
    lines[0] = lines[0][col1:]
    lines[-1] = lines[-1][:col2+1]
    #print(lines)
    return lines, starting_line_num, ending_line_num, col1, col2
  
endPython

function! s:get_v_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
"check if variable is defined
if exists('g:loaded_myplugin') == 0
   let g:labels = {'S': 1,'A':2,'U':3,'R':4,'T':5}   
endif  

func MyMenuFilter(id, key)
      
          " Handle shortcuts
	  
          if has_key(g:labels, a:key)
             call popup_close(a:id, g:labels[a:key])
             return 1
          endif
        

          " No shortcut, pass to generic filter
          return popup_filter_menu(a:id, a:key)
endfunc     
func MyMenuFilter1(id, key)
          let g:labels = {'S': 1,'A':2,'U':3,'R':4,'T':5}
          " Handle shortcuts
	  
          if a:key == 'S'
             call popup_close(a:id, 1)
             return 1
          endif
          if a:key == 'A'
             call popup_close(a:id, 2)
             return 1
          endif
          if a:key == 'U'
             call popup_close(a:id, 3)
             return 1
          endif
          if a:key == 'R'
             call popup_close(a:id, 4)
             return 1
          endif
          if a:key == 'T'
             call popup_close(a:id, 5)
             return 1
          endif

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
print(labels)
for key,value in labels.items():
	#print(key, value, r)
	if value  == r:
	   vim.command("call WrapTag('"+key+"')")   
endPython
endfunction         

function! MenuCB1(id, result)
py3 << endPython
import vim

r = vim.eval("a:result")

#visual_selection, bgn_line, end_line, start_pos, end_pos = get_visual_selection()


#selected_text = "\\n".join(visual_selection) 
if r == '1':
	new_text = "\<S\>"+"\\r".join(visual_selection)+"\<\/S\>"
	new_text = new_text[:len(new_text)]
	#new_t = ["[["]+visual_selection+["]]"]

	#vim.current.buffer[bgn_line]=new_text

	#vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)
	vim.command("call WrapTag('S')")
	

if r == '2':
	new_text = "\<A\>"+"\\r".join(visual_selection)+"\<\/A\>"
	new_text = new_text[:len(new_text)]

	#vim.current.buffer[bgn_line]=new_text

	#vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)



	vim.command("call WrapTag('A')")


if r == '3':
	new_text = "\<U\>"+"\\r".join(visual_selection)+"\<\/U\>"
	new_text = new_text[:len(new_text)]

	#vim.current.buffer[bgn_line]=new_text

#	vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)
	vim.command("call WrapTag('U')")

if r == '4':
	new_text = "\<R\>"+"\\r".join(visual_selection)+"\<\/R\>"
	new_text = new_text[:len(new_text)]

	#vim.current.buffer[bgn_line]=new_text

	#vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)

	vim.command("call WrapTag('R')")
if r == '5':
	new_text = "\<T\>"+"\\r".join(visual_selection)+"\<\/T\>"
	new_text = new_text[:len(new_text)]

	#vim.current.buffer[bgn_line]=new_text

#	vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)



	vim.command("call WrapTag('T')")
endPython
endfunction



function! GetRange() range
py3 << endPython
import vim



visual_selection, bgn_line, end_line, start_pos, end_pos = get_visual_selection()



selected_text = ("\\n".join(visual_selection))
new_text = "[["+"\\r".join(visual_selection)+"]]"
new_t = ["[["]+visual_selection+["]]"]

vim.command("call WrapTag('')")

#print("\\r".join(visual_selection))


#vim.command(str(bgn_line)+","+str(end_line)+"s/"+str(selected_text)+"/"+new_text)

endPython
endfunction

function! GetPramaters() range
py3 << endPython
import vim


visual_selection, bgn_line, end_line, start_pos, end_pos = get_visual_selection()
#visual_selection = vim.command("call s:get_v_selection()")
#print("v:", visual_selection)

selected_text = "\\n".join(visual_selection) 

#print(selected_text)
vim.command("call popup_menu(['[S]ender', '[A]ttribute', 'S[u]bject', '[R]ecipient','[T]P'], #{filter: 'MyMenuFilter', callback:'MenuCB',})")


endPython
endfunction

command! -range Range call GetRange()
command! -range Params call GetPramaters()




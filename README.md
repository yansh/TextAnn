![GitHub Logo](/TextAnn.png)

TextAnn in a multi-purpose text annotation vim plugin. 

## Requirements

* Python 3.X
* version of Vim 8.2 or higher

## Installation

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/yansh/Textann ~/.vim/bundle/Textann`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/yansh/Textann'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/yansh/Textann'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/yansh/Textann'` to .vimrc
  - Run `:PlugInstall`


## Usage

Configure your labels in your .vimrc:

```vim
    let g:labels = {"[S]ender":'S',  
              \ "[A]ttribute":"A", 
              \ "[R]]cipient":"R", 
              \ "S[u]bject":"U", 
              \ "[T]P": "T",        		 
              \ "AI[M]": "M",
              \"[H]edge Modal": "H"}
```

Set the key to trigger the Parameters pop-up (e.g., Ctrl P)
    ```
      map <C-p> :Params<CR>   
    ```

Set the syntax:
```
    set syntax=vim_textann_default   
```
You can then open a text file to annotate. 

[TextAnn Usage Example - Watch Video](https://www.loom.com/share/793d8d0fa1824f67902bc2eeb72f3901)

[![](https://cdn.loom.com/sessions/thumbnails/793d8d0fa1824f67902bc2eeb72f3901-with-play.gif)](https://www.loom.com/share/793d8d0fa1824f67902bc2eeb72f3901)


# Credit

This plugin was designed using the excellent [Vim PluginStarter Kit](https://github.com/yansh/vim-plugin-starter-kit)

# References

[1] Beyond the text: Analysis of privacy statements through syntactic and semantic role labeling. Shvartzshanider, Y., Balashankar, A., Wies, T., & Subramanian, L. 
In Proceedings of the natural legal language processing workshop 2023, pages 85–98, Singapore, December, 2023. Association for Computational Linguistics.

[2] Going against the (appropriate) flow: A contextual integrity approach to privacy policy analysis. Shvartzshnaider, Y.; Apthorpe, N.; Feamster, N.; and Nissenbaum, H. In Proceedings of the AAAI Conference on Human Computation and Crowdsourcing, volume 7, pages 162–170, 2019

# Track performance issue

Sometimes your vim is getting slow like mine recently. Vim have a functionality that let you profile your current vim setup.

In my case vim was slow on regular tasks like switching windows, move around lines, etc.

Start vim, try to setup an environment where you get some performance issues. Then :

```vim
:profile start profile.log
:profile func *
:profile file *
```
Then do the slow actions

```vim
:profile pause
:noautocmd qall!
```

You can then read the `profile.log` written. You will see functions called and how was the slowest.

For example :
```
FUNCTIONS SORTED ON TOTAL TIME
count  total (s)   self (s)  function
  104   0.514244   0.009151  airline#check_mode()
   13   0.502291   0.064144  airline#highlighter#highlight()
    2   0.400568   0.000253  <SNR>18_FileRead()
    2   0.399797   0.000347  <SNR>18_repo_rev_parse()
    2   0.399450   0.000965  <SNR>18_repo_git_chomp()
 2466   0.359586   0.118470  airline#highlighter#exec()
 4094   0.268886   0.084217  airline#highlighter#get_highlight()
  710   0.222731   0.021535  <SNR>69_exec_separator()
 8188   0.154892             <SNR>69_get_syn()
 1420   0.102734   0.007764  airline#themes#get_highlight()
   26   0.083224   0.009266  9()
17262   0.081905             <SNR>69_Get()
   12   0.071159   0.000205  <SNR>21_on_window_changed()
   12   0.070908   0.001352  airline#update_statusline()
   16   0.069478   0.000661  <SNR>22_invoke_funcrefs()
    1   0.060385   0.000984  rails#buffer_setup()
  105   0.055001   0.001231  <SNR>73_get_seperator()
  129   0.047493   0.002337  <SNR>73_get_transitioned_seperator()
  129   0.045156   0.001894  airline#highlighter#add_separator()
   17   0.035291   0.000607  airline#extensions#tabline#get()
```

For me it was airline (https://github.com/vim-airline/vim-airline/issues/1026#issuecomment-200457594) then matchbracket. Now I have a fast vim !

if has("cscope")

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if !exists("g:cscope_max_depth")
        let g:cscope_max_depth = 6
    endif

    if !exists("g:cscope_quickfix") || g:cscope_quickfix != 0
        :set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif


    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    else
        let cscope_file = "cscope.out"
        let g:cscope_i = 0

        while g:cscope_i < g:cscope_max_depth
            if filereadable(cscope_file)
                :execute "cs add " . cscope_file
                break
            else
                let cscope_file = "../" . cscope_file
                let g:cscope_i += 1
            endif
        endwhile

    endif

    " show msg when any other cscope db added
    set cscopeverbose

endif


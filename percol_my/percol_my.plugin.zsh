if which percol &> /dev/null; then
    function percol_select_history() {
        local tac
        which gtac &> /dev/null && tac="gtac" || { which tac &> /dev/null && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --prompt-bottom --result-bottom-up --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle -R -c
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history

    if which marks &> /dev/null; then
        function percol_select_marks() {
            BUFFER=$(marks | percol --prompt-bottom --result-bottom-up --query "$LBUFFER" | awk '{print $3}')
            CURSOR=$#BUFFER # move cursor
            zle -R -c       # refresh
        }
        zle -N percol_select_marks
        bindkey '^B' percol_select_marks
    fi
fi

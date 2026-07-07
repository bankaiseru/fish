if status is-interactive
    # Alias
    alias cls "clear"
    alias ls "lsd"
    alias cat "bat"
    alias df "duf"

    starship init fish | source # StarShip
    direnv hook fish | source # DirEnv
    
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    function cp_output # Copy output
        set -l last_cmd (history | head -n 1)
        if test -n "$last_cmd"
            eval $last_cmd | string replace -r '\x1b\[[0-9;]*m' '' | wl-copy
        end
    end

    bind \ec cp_output # Copy output key
end

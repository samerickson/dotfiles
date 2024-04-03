if status is-interactive
    # Commands to run in interactive sessions can go here
    function starship_transient_prompt_func
      starship module character
    end
    starship init fish | source
    enable_transience

    source ~/.config/shell/aliases
end

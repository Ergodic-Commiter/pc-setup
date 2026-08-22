function history_grep
    history | tac | grep --color=always -i $argv | less -R +G
end

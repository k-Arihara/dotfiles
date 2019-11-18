shopt -s expand_aliases


alias la='ls -la'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias boot-code-noauth='~/code-server/code-server --allow-http --no-auth'
alias boot-code='~/code-server/code-server --allow-http'
alias pushd='pushd ./'


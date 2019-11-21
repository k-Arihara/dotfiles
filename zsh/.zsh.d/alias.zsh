

alias boot-code-noauth='~/code-server/code-server --allow-http --no-auth'
alias boot-code='~/code-server/code-server --allow-http'
alias pushd='pushd ./'

alias ls='ls --color=auto'
alias la='ls -la --color=auto'

cdls()
{
  \cd "$@" && ls -la
}
alias cd="cdls"


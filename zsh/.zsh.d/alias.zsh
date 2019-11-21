alias boot-code-noauth='~/code-server/code-server --allow-http --no-auth'
alias boot-code='~/code-server/code-server --allow-http'
alias pushd='pushd ./'

alias la='ls -la'

cdls()
{
  \cd "$@" && ls -la
}
alias cd="cdls"


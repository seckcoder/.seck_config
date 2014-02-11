#if ( -f /bin/zsh ) exec /bin/zsh

# unset PYTHONPATH   # I don't know when I set this...
test -s ~/.alias && . ~/.alias || true

alias "c=xclip"
alias "v=xclip -o"
alias "cb=xclip -selection clipboard"

set -o vi
force_color_prompt=yes
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;31m\]@\[\033[01;36m\]\h\[\033[01;33m\]:\[\033[01;31m\]\w\[\033[01;33m\]\$ '
[[ "$TERM" == dumb ]] && PS1="\n\w@\u$"
[[ "$TERM" != dumb ]] && PS1="\n\[\e[1;36m\]\w\[\e[0;32m\]@\u$ \[\e[0m\]"

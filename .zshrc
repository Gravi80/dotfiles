alias gs='git status'
alias gpr='git pull --rebase'
alias vssh='vagrant ssh'
alias rp='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start &'

export PATH=/usr/local/bin:$PATH

ZSH_THEME="powerlevel9k/powerlevel9k"

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.sublime.plugin.zsh

### for running z tool
. `brew --prefix`/etc/profile.d/z.sh

archey -c
cn(){ ARG1=${1:-1};echo "Enjoy🍺, I Will be awake for $ARG1 hour(s)";caffeinate -t $(( $ARG1 * 60 * 60 ));}
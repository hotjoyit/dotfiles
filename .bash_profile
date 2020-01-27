source ~/.bashrc
export M2_HOME=/usr/local/Cellar/maven/3.6.1/libexec
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME/bin
export BASH_SILENCE_DEPRECATION_WARNING=1

if which jenv > /dev/null; then eval "$(jenv init -)"; fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# colors
GREEN='\e[0;32m\]'
B_GREEN='\e[1;32m\]'
MAGENTA='\e[0;35m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
B_YELLOW='\e[1;33m\]'
RED='\e[0;31m'
BLUE='\e[0;34m'
B_BLUE='\e[1;34m'
CYAN='\e[0;36m\]'
COLOR_END='\[\033[0m\]'
# PROMPT ----------------------------------------------------------------------
# PS1="\h:\W \u\$ "  # default promopt
export PS1="${MAGENTA}\$(date +%Y-%m-%d-%a) \
${B_YELLOW}\$(date +%T) \
${GREEN}\u \
${B_MAGENTA}\h \
${B_BLUE}\w \
${COLOR_END}\
\$(/usr/local/bin/githud bash)\n\$ "
# \u 사용자, \h HOST, \w PWD
# githud: https://github.com/gbataille/gitHUD
# githud prompt explained: https://github.com/gbataille/gitHUD/blob/master/docs/PROMPT_EXPLAINED.md
# Aliases
if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'; #gnu
    alias l.='ls -d .* --color=auto'
else
    alias ls='ls -G'; #osx
    alias l.='ls -dG .*'
fi
alias ll='ls -alh'
alias vi='mvim -v'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias cd..='cd ..'
alias ctags='`brew --prefix`/bin/ctags'
alias tmux="TERM=screen-256color tmux"
alias tm="tmux attach || tmux new"
alias ag='ag --path-to-ignore ~/.agignore'
alias agl='ag --pager="less -XFR"'
alias ncd='ncdu --color dark -rr -x'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias bc='bc -l ~/.bcrc -q'
# git auto completion ( file from: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash )
[ -f ~/.local/bin/git-completion.bash ] && source ~/.local/bin/git-completion.bash
# John Grib's favorite directory jump
[ -f ~/.local/bin/fav-dir.sh ] && source ~/.local/bin/fav-dir.sh
bind '"\ev": "fav\C-m"'     # meta + v 를 누르면 fav 를 실행해 준다.
# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ls /usr/local/bin | sort -R | head -1 | xargs printf "Did you know about %s ?\n"
fortune $HOME/quotes/quotes.txt

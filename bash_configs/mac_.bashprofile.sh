# .bashrc

export RSTUDIO_WHICH_R=/opt/homebrew/Caskroom/miniforge/base/bin/R

export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadacec

# Use bat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# lesspipe deactivation - keep this for security reasons
unset LESSOPEN; unset LESSCLOSE

# Take the chain out of the chainsaw
alias dd='echo use /usr/bin/dd for dd'
alias rm='echo -e "Use /bin/rm to permanently delete files, \
otherwise use trash-put or tp\n"'
alias tp='trash-put'
alias tl='trash-list'
alias script='sdfsa'
alias script_real='script'

# Aliases, shortcuts, and QOL improvements
alias z='zcat'
alias h='head'
alias t='tail'
alias vi='vim'
alias find='gfind'
alias readlink='greadlink'

alias du='du -sh'
alias lss='zless -S'
alias grep='grep --color=auto'

alias wcl='wc -l'
alias rq='R -q'
alias rl='readlink -e'
alias ca='conda activate'

alias xpressargs='xargs -I {}'
alias htopu='htop -u `whoami`'
alias suc='sort | uniq -c'

alias d='cd'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls='ls -G'
alias l='ls'
alias ll='ls -hl'
alias lll='ls -hlrt'

alias glog='git log'
alias gst='git status'
alias gad='git add'
alias gcomm='git commit'

# Helpers
alias bashedit='nano ~/.bash_profile'
alias bashsource='source ~/.bash_profile'

alias gini='git init && echo ".*" >> .gitignore'

# # Initialize java environment
#export PATH="$HOME/.jenv/bin:$PATH"
#export PATH="$HOME/bin:$PATH"
#eval "$(jenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && \
    source "${HOME}/.iterm2_shell_integration.bash"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# .bashrc

# If not running interactively, don't do anything and return early
[[ $- == *i* ]] || return  

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

umask 022  # Set default permissions
conda deactivate  # unload base from /usr/bin/conda

# User specific aliases and functions
export WORKDIR="/home/dricardo/work"

PATH=$PATH:$HOME/bin; export PATH

export CLICOLOR=1
export LSCOLORS=ExGxFxdaCxDaDahbadacec
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# STDERR in red
export LD_PRELOAD="/home/dricardo/sw/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
export STDERRED_BLACKLIST='^(-bash)$'

# Use bat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Bash prompt "user@host:dir$ "
export PS1="\u@\h:\w$ "

# lesspipe deactivation - keep this for security reasons
unset LESSOPEN; unset LESSCLOSE

# Take the chain out of the chainsaw
alias dd='echo use /usr/bin/dd for dd'
alias rm='echo -e "Use /bin/rm to permanently delete files, otherwise use trash-put or tp\n"'
alias tp='trash-put'
alias tl='trash-list'
alias script='sdfsa'
alias script_real='script'

# Aliases, shortcuts, and QOL improvements
alias z='zcat'
alias h='head'
alias t='tail'
alias vi='vim'

alias du='du -sh'
alias lss='zless -S'
alias grep='grep --color=auto'
alias cat='bat'

alias wcl='wc -l'
alias rq='R -q'
alias rl='readlink -e'
alias ca='conda activate'

alias xpressargs='xargs -I {}'
alias htopu='htop -u `whoami`'
alias suc='sort | uniq -c'
alias firefox='open -a firefox'

alias d='cd'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls='ls --color=auto'
# alias ls='ls -G'
alias l='ls'
alias ll='ls -hl'
alias lll='ls -hlrt'

alias git='hub'
alias gini='git init && echo ".*" >> .gitignore'
alias glog='git log'
alias gst='git status'
alias gad='git add'
alias gcomm='git commit'

alias R4='/share/apps/R-4.2.1/lib64/R/bin/R'
alias Rscript4='/share/apps/R-4.2.1/lib64/R/bin/Rscript'
alias radian4='radian --r-binary="/share/apps/R-4.2.1/lib64/R/bin/R"'

alias sv='samtools view'
alias ib='intersectBed'

# Helpers
alias bashedit='nano ~/.bashrc'
alias bashsource='source ~/.bashrc'

alias logcollapse='grep -v "^==>\|^\[" | sort | uniq -c'

# Shortcuts
alias park='cd ~/work'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dricardo/miniconda3/envs/work/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dricardo/miniconda3/envs/work/etc/profile.d/conda.sh" ]; then
        . "/home/dricardo/miniconda3/envs/work/etc/profile.d/conda.sh"
    else
        export PATH="/home/dricardo/miniconda3/envs/work/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/dricardo/miniconda3/envs/work/etc/profile.d/mamba.sh" ]; then
    . "/home/dricardo/miniconda3/envs/work/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

conda activate work
. ~/miniconda3/envs/work/share/bash-completion/bash_completion
snakemake --bash-completion
# eval "$(register-python-argcomplete conda)"


# Deprecated or no longer used items

if [ "$TERM" == "screen.xterm-256color" ]; then TERM="xterm-256color"; fi

# Server operation
alias qtt='qstat -t'
alias qr='qst | grep 'R''
alias qst='qstat -u albanus'
alias squ='squeue -u albanus'
alias sq='sq | less -S'
alias whatsrunning='sq | grep albanus | grep RUNNING | less -S'

# iTerm2 tab title function
# Usage: title "My tab title"
function title {
    echo -ne "\033]0;"$*"\007"
}

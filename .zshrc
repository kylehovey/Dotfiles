# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

plugins=(git, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

#function chpwd() {
#    emulate -L zsh
#}

# FASD
eval "$(fasd --init)"

setopt AUTO_CD

export PATH="/usr/local/opt/gnupg/libexec/gpgbin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:/usr/texbin:/usr/local/mongodb/bin"

alias commit='git commit -m'

alias gaster='git push origin master'

alias webstart='sudo apachectl start'

alias webstop='sudo apachectl stop'

alias glazy='git add -A && git commit -m "Using scripted lazy commit for fast changes" && git push origin master'

alias groot='while [ ! -d ./.git ]; do cd ..; done'

alias path="pwd | pbcopy"

alias uftp="sshfs upel:/usr/share/nginx/html/ /usr/local/mnt/ -ovolname=UPEL"

alias pftp="sshfs A02188949@files02.usu.edu:/web/web/domains/power/ /usr/local/mnt/ -ovolname=UPEL"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

alias mvim="open -a MacVim"

alias vimc="vim ~/.vimrc"

alias python="/usr/local/Cellar/python/2.7.11/bin/python"

alias grep="ggrep"

alias usu="openssl aes-256-cbc -d -in ~/Sync/usu | pbcopy"

alias chistory="rm $HISTFILE"

alias bak="sftp upel:/home/speleo/Backup/backup.zip ~/Desktop/"

alias whiteboard="convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2""

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias ass="cd ~/Dropbox/School/USU/S4"

alias web="cd ~/www/home"

alias viml="vim /usr/local/etc/lighttpd/lighttpd.conf"

alias resume="fg"

alias vimz="vim ~/.zshrc"

alias lighty="lighttpd -f /usr/local/etc/lighttpd/lighttpd.conf"

alias lightd="cd /usr/local/etc/lighttpd/"

alias la='ls -lsha'

alias tmux="tmux -2"

alias music="ncmpcpp"

alias iconfig="ifconfig en0"

alias speed="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

alias todo="vim ~/Dropbox/Todo/todo.vim"

alias upel="vim ~/Dropbox/Todo/upel.vim"

alias notebook="/anaconda/bin/jupyter_mac.command"

alias mongodb="mongod --dbpath ~/data/db"

alias gitos="git clone git@github.com:kylehovey/OS_Concurrency.git"

alias mullid="echo \"602359447330\" | pbcopy"

alias renet="sudo ifconfig en1 down && sudo ifconfig en1 up"

alias screen="/usr/local/Cellar/screen/4.5.1/bin/screen"

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[e" insert-sudo

function complex {
   local lines columns colour a b p q i pnew
   ((columns=COLUMNS-1, lines=LINES-1, colour=0))
   for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
       for ((a=-2.0; a<=1; a+=3.0/columns)) do
           for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
               ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
           done
           ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

4parse(){
    curl --silent --compressed $1 |
    tr "\"" "\n" | grep -i "i.4cdn.org" |
    uniq |
    awk '{print "https:"$0}'
}

4get(){
    wget --continue --no-clobber --input-file=<(4parse "$1")
}

#bindkey -v
#export KEYTIMEOUT=1

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt no_hist_verify

export NVM_DIR="/Users/speleo/.nvm"
alias nvml="[ -s "$NVM_DIR/nvm.sh" ] && . \"$NVM_DIR/nvm.sh\""  # This loads nvm

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

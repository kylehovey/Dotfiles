export PATH=$HOME/bin:/usr/local/bin:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH

export CXX="/usr/local/opt/llvm/bin/clang++"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git, zsh-syntax-highlighting, extract, sudo)

source $ZSH/oh-my-zsh.sh

setopt AUTO_CD

alias makec="cp -r ~/.cmake/* ./"

alias mullid="openssl aes-256-cbc -d -in ~/Dropbox/Todo/mullid | pbcopy"

alias g++="/usr/local/opt/llvm/bin/clang++"

alias ass="cd ~/Dropbox/School/USU/S5/"

alias fix="brew services restart kwm"

alias commit='git commit -m'

alias gaster='git push origin master'

alias glazy='git add -A && git commit -m "Using scripted lazy commit for fast changes" && git push origin master'

alias groot='while [ ! -d ./.git ]; do cd ..; done'

alias path="pwd | pbcopy"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

alias mvim="open -a MacVim"

alias vimc="vim ~/.vimrc"

alias whiteboard="convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2""

alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias viml="vim /usr/local/etc/lighttpd/lighttpd.conf"

alias resume="fg"

alias vimz="vim ~/.zshrc"

alias la='ls -lsha'

alias tmux="tmux -2"

alias iconfig="ifconfig en0"

alias speed="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

alias todo="vim ~/Dropbox/Todo/todo.vim"

alias upel="vim ~/Dropbox/Todo/upel.vim"

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

setopt no_hist_verify

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

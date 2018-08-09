export PATH=$HOME/bin:/usr/local/bin:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'
export CXX="/usr/local/opt/llvm/bin/clang++"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sorin"

plugins=(git, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

setopt AUTO_CD

alias master="git checkout master && git pull"
alias branch="git checkout -b"
alias dot="~/.dotfiles/push.sh"
alias gaster="git push origin master"
alias commit="git commit -m"
alias vimc="vim ~/.vimrc"
alias vimz="vim ~/.zshrc"
alias stubon="sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh"
alias stuboff="sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh -r"
alias makec="cp -r ~/.cmake/* ~/.cmake/.* ./"
alias mullid="openssl aes-256-cbc -d -in ~/Dropbox/Todo/mullid | pbcopy"
alias g++="/usr/local/opt/llvm/bin/clang++"
alias fix="brew services restart chunkwm"
alias groot="while [ ! -d ./.git ]; do cd ..; done"
alias path="pwd | pbcopy"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias tmux="tmux -2"
alias dnd="vim ~/Dropbox/Todo/dnd.md"
alias todo="vim ~/Dropbox/Todo/todo.vim"
alias adventure="open https://drive.google.com/drive/u/1/folders/1ctv3djG9DawZTHBEqSB6CSRBi2bFlgwq"
alias bank="open https://docs.google.com/spreadsheets/d/1jKbl2gOvpM562lxchtT8ihJIRDJTK-yOQKwxWh0h3Q4/edit?usp=sharing"
alias fire="open https://maps.nwcg.gov/sa/"
alias speed="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias whiteboard="convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2""

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

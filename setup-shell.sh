#!/bin/sh

function msg(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

function install(){
    msg "\nInstall: $1 ..." blue ;
}

function installSuccess() {
    msg "\nSuccess: $1 installed successfully ..." green
}

rc_file="$HOME/.shell.config"

cat banner.ascii 
echo ""

msg "Setting up system" red

# Homebrew
install "Homebrew"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

installSuccess "Homebrew"

# ZSH
install "Oh-My-ZSH"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# installSuccess "Oh-My-ZSH"

# Common packages
install "Common brew packages (wget, git, openssl, cask)"

brew tap caskroom/cask

brew install git wget openssl 

installSuccess "wget, git, openssl installed successfully"

# Node
nvm="nvm"
node="node"
yarn="yarn"
install "$nvm, $node, $yarn"
brew install nvm node yarn
installSuccess "$nvm, $node, $yarn"
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> $rc_file

# Python
python3="Python3"
install $python3
brew install python3
installSuccess $python3

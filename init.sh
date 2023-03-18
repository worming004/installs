#!/bin/bash

# neovim 
sudo dnf install -y neovim python3-neovim
mkdir -p ~/.config
cd ~/.config
git clone git@github.com:worming004/nvim-ide.git
mv nvim-ide/ nvim
sudo dnf install -y ripgrep
sudo dnf install -y fd-find

# tmux
cd ~/.config/
git clone https://github.com/worming004/tmux-conf
mv tmux-conf/ tmux
ln -s  /home/worming/.config/tmux/tmux.conf ~/.tmux.conf

# i3
sudo dnf install i3
mkdir -p ~/.config/i3/
cd ~/.config/i3/
git clone https://github.com/worming004/i3-config
mv i3-config config

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code

# kitty
sudo dnf install kitty
echo "export TERMINAL=/usr/bin/kitty" >> ~/.profile

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
. "$HOME/.asdf/asdf.sh"
asdf plugin-add elixir
asdf plugin add erlang
asdf plugin-add golang
asdf plugin-add python
asdf plugin-add kubectl
asdf plugin-add minikube
asdf plugin add cargo
asdf plugin add caddy
asdf plugin add azure-cli
asdf plugin add helm
asdf plugin add github-cli
asdf plugin add terraform
asdf plugin add gohugo
asdf plugin add gleam
asdf plugin add nodejs
asdf plugin add argo
asdf plugin add powershell-core
sudo dnf install autoconf automake
sudo dnf install ncurses-devel
sudo dnf install gcc-c++
asdf install python 3.11.2
asdf install kubectl 1.26.1 
asdf install caddy 2.6.3
asdf install azure-cli 2.45.0
asdf install helm 3.11.1
asdf install github-cli 2.23.0
asdf install terraform 1.3.8
asdf install gohugo 0.110.0
asdf install gleam 0.26.2
asdf install nodejs 19.6.0
asdf install argo 3.4.5
asdf install powershell-core 7.3.3
KERL_BUILD_DOCS=yes asdf install erlang 25.1.2
asdf install elixir 1.14.3-otp-25
asdf global python 3.11.2
asdf global kubectl 1.26.1 
asdf global caddy 2.6.3
asdf global azure-cli 2.45.0
asdf global helm 3.11.1
asdf global github-cli 2.23.0
asdf global terraform 1.3.8
asdf global erlang 25.1.2
asdf global elixir 1.14.3-otp-25
asdf global gohugo 0.110.0
asdf global gleam 0.26.2
asdf global nodejs 19.6.0
asdf global argo 3.4.5
asdf global powershell-core 7.3.3

# zsh 
sudo dnf install util-linux
sudo dnf install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(`which zsh`) $USER

# git
git config --global user.email "worming@hotmail.be"
git config --global user.name "worming"
go install github.com/jesseduffield/lazygit@latest

# i3
dnf install i3

# zsh config
tee -a ~/.zshrc << EOF
# nvim
alias nv='nvim'

# git
alias gpa='git pull --all'
alias gP='git push'
alias ga='git add .'

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# lazygit
alias lz='lazygit'

# golang
PATH=$PATH:~/.asdf/installs/golang/1.20/packages/bin/

# tmux
SHELL=$(which zsh)

# kubectl
alias k='kubectl'
source <(kubectl completion zsh)

# minikube
alias min='minikube'
source <(minikube completion zsh)

#argo
source <(argo completion zsh)

# tmux
alias tm='tmux'

# bash compatibilty
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# pack
export DOCKER_HOST="unix://$(podman info -f "{{.Host.RemoteSocket.Path}}")"
. $(pack completion --shell zsh)

EOF

#!/usr/bin/env bash

# Actualizar dependencias
sudo apt update -y

# Instalar comando no encontrado
sudo apt-get install command-not-found -y

# Instalar zsh
sudo apt install zsh -y

# Instalar oh-my-zsh
echo "n" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $(whoami)

# Instalar plugins
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

# Instalar fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo "y y y" | ~/.fzf/install

# Cambiar configuración archivo zshrc
sed -i 's@plugins=(.*)@plugins=(git zsh-nvm fzf fzf-tab zsh-autosuggestions zsh-syntax-highlighting)@' ~/.zshrc

echo "source /etc/zsh_command_not_found" >> ~/.zshrc

# Recargar zshrc
/bin/zsh -i -c source ~/.zshrc

# Instalar nvm
/bin/zsh -i -c "nvm install node"
/bin/zsh -i -c "npm install -g tldr"

# Ingresar en zsh
/bin/zsh
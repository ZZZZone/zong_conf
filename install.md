
```sh

# ====================
# ====== zsh =========
# ====================

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mv ~/.zshrc ~/.zshrc.backup
ln -s -v ~/zong_conf/zsh/zshrc ~/.zshrc

# === zsh with powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# === zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# === autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# === git-open
git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

# autojump
brew install autojump


# install HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ====================
# ==== neofetch ======
# ====================
brew install neofetch

# ====================
# ====== tmux ========
# ====================
brew install tmux

mv ~/.tmux.conf ~/.tmux.conf.backup
ln -s zong_conf/tmux/tmux.conf ~/.tmux.conf
mv ~/.tmux.conf.local ~/.tmux.conf.backup.local
ln -s zong_conf/tmux/tmux.conf.local ~/.tmux.conf.local


# tmux plug manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ====================
# ==== alacritty =====
# ====================
brew install alacritty
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
ln -s  -v ~/zong_conf/alacritty  ~/.config

# ====================
# ====== neovim ======
# ====================
brew install neovim

ln -s  -v ~/zong_conf/nvim  ~/.config/nvim
ln -s  -v ~/zong_conf/vim/vimrc ~/.vimrc

pip3 install neovim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# PlugInstall & CocInstall
nvim -c 'PlugInstall | CocInstall -sync coc-json coc-html coc-go coc-sql coc-vimlsp coc-explorer coc-thrift-syntax-support coc-translator|q'


# tmux-256 color not necessary
# https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95
curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
/usr/bin/tic -xe tmux-256color terminfo.src

# ====== ideavim ======
ln -s -v ~/zong_conf/vim/ideavimrc ~/.ideavimrc

# ====================
# ===== lazygit ======
# ====================
brew install lazygit

# ====================
# ===== ranger =======
# ====================
brew install ranger


# jq is a lightweight and flexible command-line JSON processor.
brew install jq


# ====================
# ======= fzf ========
# ====================
brew install fzf
$(brew --prefix)/opt/fzf/install


# ==================== cask

# ====================
# ==== stretchly =====
# ====================
brew install --cask stretchly

# ====================
# ====== stats =======
# ====================
brew install --cask stats
```


#/bin/bash
set -x

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# alacritty
git clone https://github.com/alacritty/alacritty /tmp/Alacritty
pushd /tmp/Alacritty
cd /tmp/Alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/
popd

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# plugin for oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
brew install kube-ps1

# neovim
brew install neovim

# tmux + tmuxp
brew install tmux
brew install tmuxp
## setup tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

set +x
# setup manuallly
echo "This is the last step, please setup manually"
echo "Replace plugins in .zshrc file with:"
echo "
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
kubectl
kube-ps1
history-substring-search
zsh-z
fzf-tab
)
"
Copy of my dotfiles as of 08022024

Clone this repo to ~

## zshrc setup
```
cd ~
# whatever command to install zsh
chsh -s $(which zsh) # change shell
# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# enable autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# place aliases file
ln -s ~/dotfiles/aliases.zsh ${ZSH_CUSTOM}/aliases.zsh
# if using miniconda
./miniconda3/bin/conda init zsh
```
Put the following in `~/.zshrc` plugins section
```
plugins=(
    git
    compleat
    copybuffer
    copypath
    eza
    zsh-autosuggestions
)
```

## Neovim setup
```
# download appimage
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage .nvim.appimage
mkdir .config
cd .config
ln -s ~/dotfiles/nvim .
```

## Wezterm
[The best terminal emulator](https://wezfurlong.org/wezterm/index.html)
```
# In WSL, place config file in Windows %HOME% directory, e.g.
# must use cp because windows can't read WSL symlinks (of course not!)
cp ~/dotfiles/wezterm.lua /mnt/c/Users/ogataj/.wezterm.lua
```


## R
Good luck.

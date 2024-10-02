Copy of my dotfiles as of 08022024

Clone this repo to ~

## zshrc setup
```
cd ~
# whatever command to install zsh
chsh -s $(which zsh) # change shell
# copy zshrc to ~/.zshrc
# if using miniconda
./miniconda3/bin/conda init zsh
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

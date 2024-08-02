alias today="date +%m%d%Y"
alias vim="nvim"
alias yeet="rm -rf $1"
alias c="clear -x"
alias hello="source ~/.zshrc"
alias edit="vim ~/.zshrc ~/.oh-my-zsh/custom/aliases.zsh"
alias vedit="pushd ~/.config/nvim; nvim .; popd"
alias wedit="vim /mnt/c/Users/ogataj/.wezterm.lua"
alias lg="lazygit"
alias z="zellij -s $(today)"

# knit r file
function knit() {
  mkdir -p ./results/knitted_documents
  R -e "rmarkdown::render('$1', output_dir = './results/knitted_documents')"
}

function pullbio() {
  scp -r ogataj@rhbioproteo1.whirc.local::${1} .
}

# move file to desktop
function xfer() {
  TO=/mnt/c/Users/ogataj/Desktop
  # if [[ ! -f ${1} ]] || [[ ! -d ${1} ]]; then
  #     echo "ERROR, ${1} is not a file or directory"
  #     return 1
  # fi
  if [[ -z ${2} ]]; then
    \command cp -rf ${1} ${TO}
  elif [[ -d ${TO}/${2} ]]; then
    \command cp -rf ${1} ${TO}/${2}
  else
    echo "ERROR ${TO}/${2} is not a directory"
  fi
}

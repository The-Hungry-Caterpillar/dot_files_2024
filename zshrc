# plugin manager --------------------------------------------------------------
# set directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# download zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# source zinit
source "${ZINIT_HOME}/zinit.zsh"
 
# compinit --------------------------------------------------------------------
zstyle :compinstall filename '/home/ogataj/.zshrc'
autoload -Uz compinit
compinit
# load completions
autoload -U compinit && compinit

# plugins ---------------------------------------------------------------------
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# powerline10k ----------------------------------------------------------------
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# history preferences ---------------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
unsetopt autocd beep extendedglob nomatch notify
setopt appendhistory
# share history across sessions
setopt sharehistory
# commands starting with space do not go to history file
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# search through history
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# completion styling ----------------------------------------------------------
# case insensitive
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
# highlight directories in completion
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
# disable default zshell completion menu
zstyle ":completion:*" menu no
# preview subdirectories in completion menu
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"

# other -----------------------------------------------------------------------
# fuzzy finder integration
eval "$(fzf --zsh)"


# aliases ---------------------------------------------------------------------
alias ls="ls --color"
alias l="ls -lah"
alias yeet="rm -rf $1"
alias c='clear -x'
alias tree='tree --dirsfirst -F'
alias hello='source ~/.zshrc'
alias vim="~/.nvim.appimage"
alias vedit='pushd ~/.config/nvim; ~/.nvim.appimage .; popd'
alias edit='vim ~/.zshrc'
alias tedit="vim ~/.tmux.conf.local"
alias redit="vim ~/.Rprofile"
alias today="date +%m%d%Y"
alias lg="lazygit"
she () {
    mkdir -p OUT
    JOB=$(basename ${1} .sh)
    TIME=$(date +%Y%m%d-%H%M)
    /usr/bin/time sh ${1} > OUT/${JOB}_${TIME}.out 2>&1
}
function knit() {
    OUT=./results/knitted_documents
    mkdir -p ${OUT}
    R -e "rmarkdown::render('$1', output_dir=\"${OUT}\")"
}
Rs () {
    mkdir -p OUT
    JOB=$(basename ${1} .sh)
    TIME=$(date +%Y%m%d-%H%M)
    Rscript ${1} >& OUT/${JOB}_${TIME}.out
}
makeproteomics () {
    mkdir ProjectMetaData
    mkdir -p MCC-CPP_Proteomics/TMT/Global/DDASearchResults
    mkdir -p MCC-CPP_Proteomics/TMT/Phospho/DDASearchResults
    cp /mnt/centos-storage-1-home/ogataj/Documents/run_global.sh .
    cd MCC-CPP_Proteomics
    cp /mnt/centos-storage-1-home/centoswhirc/newscripts/TMT_GLOBAL.Rmd .
    cp /mnt/centos-storage-1-home/centoswhirc/newscripts/TMT_PHOSPHO_RMD.Rmd .
    cp /mnt/centos-storage-1-home/centoswhirc/newscripts/multi_phospho_rmd_wrapper.R .
    cp /mnt/centos-storage-1-home/centoswhirc/newscripts/Multi-Rollup-Wrapper.R .
    cp /mnt/centos-storage-1-home/centoswhirc/newscripts/Level4.Rmd .
    cd ..
}
makeR () {
    cp ~/Rtemplate.R . && mv Rtemplate.R ${1}
}

# vim mode, e.g. <esc> to normal mode and "i" for insert
bindkey -v

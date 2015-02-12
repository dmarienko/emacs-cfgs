# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme bira
set fish_theme fox
#set fish_theme jacaetevha
#set fish_theme zish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins bundler z
set fish_plugins extract z

alias we="subl"
alias gs="git status"
alias gc="git commit"
alias ga="git add"
alias gb="git branch"
alias tczf="tar czf"
alias v="less"
alias e="vim"
alias l="ls++"
alias df="dfc"

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

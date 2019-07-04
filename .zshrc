# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/`whoami`/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
EDITOR='vim'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa.pub"
export PATH=~/.local/bin:/usr/bin/terraform:$PATH

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.node_modules/bin"
export LC_MESSAGES="C"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /home/`whoami`/.rvm/scripts/rvm

# Copy .z.sh to $HOME
. /home/`whoami`/.z.sh

alias zshconfig="vim ~/.zshrc"
alias zsh_reload="source ~/.zshrc"

alias srsc="spring rails c"

alias pu="sudo pacman -Syu"
alias pi="sudo pacman -S"
alias pr="sudo pacman -Rns"

# Requires vim installed
alias v="vim"
# Requires nmap
alias nmap="sudo nmap"

alias sqlmap="python2 /opt/sqlmap/sqlmap.py"

alias nikto="/opt/nikto/program/nikto.pl"

# Alias for ranger
alias r="ranger"
export GPG_TTY=$(tty)
export RANGER_LOAD_DEFAULT_RC=false
alias ls="ls -l"

# Requires ghidra from NSA
alias ghidra='/opt/ghidra/ghidraRun'

# Requires the harvester
alias theharvester='python3 /opt/theHarvester/theHarvester.py'

alias blackarch_packages="sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u"

alias bfg='java -jar /opt/bfg/bfg.jar'

alias vpn='sudo openvpn /home/l4z/blehblehbleh/nsantiago.ovpn'

alias dep='$GOPATH/bin/dep'

alias proton='$HOME/proton_vpn/protonvpn'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/l4z/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

export SLACK_CLIENT_ID="595758498352.606955104070"
export SLACK_CLIENT_SECRET="fc64226581ff73daeed035d2f695ef02"
export CALLBACK_URI="http://localhost:3000/oauth/callback"


export APP_CLIENT_ID='YPHSvyDDcYZGDcmG'
export APP_CLIENT_SECRET='qW7fhUKYdYtksrIoan_bTsHPtz99CgLlvHTlKylworQ'
export APP_SECRET="software engineers are the wizards of the 21st century"
export SERVER_ADDRESS='18.136.106.163'
export USER='l4z'


[[ -s "/home/l4z/.gvm/scripts/gvm" ]] && source "/home/l4z/.gvm/scripts/gvm"

# Terraform environment variable values for  testing n-tier
export SUBDOMAIN="terraform"
export DOMAIN="l4z.xyz"
export HOSTEDZONENAME="l4z.xyz."

alias pacshit="pacman"

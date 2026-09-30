# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias dc='docker compose'
alias dc='docker compose'
alias sshprontomed='kitten ssh root@192.168.1.56'
alias sshmedcin='kitten ssh root@192.168.200.17'
alias sshhostinger='kitten ssh root@187.77.45.44'
alias prdpmed='oracle-query prd'
alias trnpmed='oracle-query tst'
alias prdmv='oracle-query med'
alias smlmv='oracle-query medtst'
alias prdsol='oracle-query sol'
alias trnsol='oracle-query soltst'
alias codedash='cd ~/Documents/GitHub && code dash'
alias codemedcin='cd ~/Documents/GitHub && code dash-medcin'
alias codesol='cd ~/Documents/GitHub && code ipa-prontomed'
alias codeportal='cd ~/Documents/GitHub && code portal-empresa'
alias ls='eza'

# Oracle Instant Client
export ORACLE_HOME="$HOME/.local/oracle/instantclient_21_9"
export LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"
export PATH="$ORACLE_HOME:$PATH"
export TNS_ADMIN="$ORACLE_HOME/network/admin"

export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/ernane/.opencode/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/ernane/.lmstudio/bin"
# End of LM Studio CLI section


# Android / Expo local builds
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export JAVA_HOME="$HOME/Android/jdk/jdk-17"
export PATH="$JAVA_HOME/bin:$PATH"

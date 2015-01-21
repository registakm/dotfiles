# --------------------------------
# --------------------------------
# --------------------------------

# --------------------------------
# ------- zsh-completions --------
# --------------------------------
if [ -f $(brew --prefix git)/share/zsh-completions ]; then
  fpath=($(brew --prefix git)/share/zsh-completions $fpath)
fi
# --------------------------------
# ---- zsh-syntax-highlighting ---
# --------------------------------
if [ -f ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ${HOME}/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --------------------------------
# ----------- PROMPT -------------
# --------------------------------
autoload -Uz vcs_info
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
PROMPT="%F{cyan}%B%n:%m%b%f %F{yellow}%~ %1 %f
$ "
# --------------------------------
# ---------- git-prompt ----------
# --------------------------------
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '(%F{green}%b%c%u%F{grey})'
zstyle ':vcs_info:*' stagedstr '%F{green}+'
zstyle ':vcs_info:*' unstagedstr '%F{red}!'
precmd () {
  vcs_info
}
RPROMPT='${vcs_info_msg_0_}'

# --------------------------------
# ----------- GENERAL ------------
# --------------------------------
export LANG=ja_JP.UTF-8


# --------------------------------
# --------- COMPLETION -----------
# --------------------------------
autoload -Uz compinit
compinit -u
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# --------------------------------
# ----------- HISTORY ------------
# --------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# --------------------------------
# ------------ ALIAS -------------
# --------------------------------
alias ls="ls -GAF"
alias ll="ls -l"

# --------------------------------
# -------------- go --------------
# --------------------------------
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# --------------------------------
# ----------- rbenv --------------
# --------------------------------
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# --------------------------------
# ----------- nodebrew -----------
# --------------------------------
export PATH=$HOME/.nodebrew/current/bin:$PATH

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
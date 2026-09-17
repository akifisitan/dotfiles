export PATH="./:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code --wait"
fi

alias zshconfig="code ~/.zshrc"
alias refresh="exec zsh"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

alias c="clear"
alias pn="pnpm"
alias pnx="pnpm dlx"
alias npm="pnpm"
alias npx="pnpm dlx"

alias gs="git status"

# cargo
case ":$PATH:" in
  *":$HOME/.cargo/bin:"*) ;;
  *) export PATH="$HOME/.cargo/bin:$PATH" ;;
esac

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# opencode
alias ocd="opencode"

export OPENCODE_CONFIG_DIR="/mnt/c/Users/user/projects/dotfiles/opencode"

# Zsh tab completion
autoload -Uz compinit
compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zinit light zsh-users/zsh-autosuggestions

set_win_title() {
  printf '\033]0; %s \007' "${PWD:t}"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set_win_title

# mise
eval "$(~/.local/bin/mise activate zsh)"

# zoxide
alias cd="z"
alias cdi="zi"
eval "$(zoxide init zsh)"

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

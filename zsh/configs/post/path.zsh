# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# ensure other directories are loaded first
PATH="$HOME/workspace/notebooks:$PATH"
PATH="$HOME/.rbenv/shims:$PATH"
PATH=".git/safe/../../bin:$PATH"
PATH=":$PATH"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

export -U PATH

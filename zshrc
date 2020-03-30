# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# # docker env
# eval $(docker-machine env default)

# kube config env var
export KUBECONFIG=/Users/wayneliu/workspace/config/DevKube/kubeconfig

# tiny care terminal env vars
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'
export TTC_REPOS='~/workspace'
export TTC_WEATHER='New York, NY'
export TTC_CELSIUS=false
export TTC_APIKEYS=false
export TTC_UPDATE_INTERVAL=20

# for golang
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin

# for platform
export PLATFORM=~/workspace/platform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for heroku autocomplete
printf "$(heroku autocomplete:script zsh)"

# for android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

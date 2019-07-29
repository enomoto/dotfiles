# Update Homebrew, formulae, and packages

brew update
brew upgrade
apps=(
  git
  git-lfs
  tig
  ghq
  tree
  hub
  peco
  lua
  vim
  ctags
  wget
  awscli
  mysql
  rbenv
  ruby-build
  redis
  pyenv
  pyenv-virtualenv
  python3
  ffmpeg
  cmake
  ninja
  swiftlint
  sbt
  golang
  carthage
  cloc
)

brew install "${apps[@]}"

apps=(
  abstract
  android-studio
  charles
  docker
  editaro
  figma
  flux
  google-chrome
  intellij-idea-ce
  iterm2
  jasper
  macdown
  pusher
  skitch
  slack
)

brew cask install "${apps[@]}"


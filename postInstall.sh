#!/bin/zsh

echo "Configurando tema spaceship"
sed -i 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="spaceship"/' $HOME/.zshrc

echo 'SPACESHIP_PROMPT_ORDER=(
  user # Username section
  dir # Current directory section
  host # Hostname section
  git # Git section (git_branch + git_status)
  hg # Mercurial section (hg_branch + hg_status)
  exec_time # Execution time
  line_sep # Line break
  jobs # Background jobs indicator
  exit_code # Exit code section
  char # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "' >> $HOME/.zshrc
echo "spaceship configurado"

echo "configurando os puglins syntax highlighting e autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/^plugins=(git)$/#plugins removidos via script/' $HOME/.zshrc #REMOVE A CONFIGURAÇÃO EXISTENTE DE PLUGINS
echo 'plugins=( 
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
' >> $HOME/.zshrc # ADICIONA A NOVA CONFIGURAÇÃO DE PLUGINS COM O SYNTAX HIGHLIGHT E O AUTOSUGGESTIONS

echo "plugins configurados."

source $HOME/.zshrc

echo "terminado."


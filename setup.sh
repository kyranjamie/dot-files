# Ensure conig dir exists
mkdir $HOME/.config

ln -s $HOME/dev/dot-files/zsh/.hushlogin $HOME
ln -s $HOME/dev/dot-files/zsh/.aliases.zsh $HOME
ln -s $HOME/dev/dot-files/zsh/.zshrc $HOME
ln -s $HOME/dev/dot-files/zsh/.functions.zsh $HOME
ln -s $HOME/dev/dot-files/zsh/.prompt.zsh $HOME

ln -s $HOME/dev/dot-files/.inputrc $HOME
ln -s $HOME/dev/dot-files/.tmux.conf $HOME
ln -s $HOME/dev/dot-files/.ackrc $HOME
ln -s $HOME/dev/dot-files/.gitconfig $HOME
ln -s $HOME/dev/dot-files/.hammerspoon $HOME

ln -s $HOME/dev/dot-files/ranger $HOME/.config
ln -s $HOME/dev/dot-files/karabiner $HOME/.config
ln -s $HOME/dev/dot-files/nvim $HOME/.config

# Sublime Text
ln -s $HOME/dev/dot-files/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -s $HOME/dev/dot-files/snippets $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -s $HOME/dev/dot-files/Default\ \(OSX\).sublime-keymap $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/


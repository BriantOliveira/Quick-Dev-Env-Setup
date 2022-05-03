#!/bin/bash

# Install XCode / XCode CLI tools
if command -v xcode-select &> /dev/null; then
	echo "Xcode installed, installing commandline tools if not already installed"
	xcode-select --install 2> /dev/null
	echo "Successfully installed xcode-cli tools"
else
	echo "Xcode is not installed, would you like to install it now? (y/n)"
	read installXCode
	if [ $installXCode = "y"] || [ $installXCode = "yes" ]; then
		echo "Opening up the browser to the app stores Xcode page"
		open https://itunes.apple.com/us/app/xcode/id497799835?mt=12
		echo "After installing XCode, please rerun the script and xcode tools shall be installed upon next run"
	else
		echo " Xcode is needed for anything else to install. Shutting down."
	exit
	fi
fi

# Installing brew pkg manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

# Install all languages requested
echo "Installing selected languages on to the system"
brew install python
brew install node
brew install go

# Install all terminals requested
echo "Installing selected terminal emulators on to the system"
brew install --cask iterm2

# Install all shells requested
echo "Installing selected shells on to the system"
brew install zsh

# Configuring the shell you selected as your primary shell to be just that
echo "Setting zsh to be your primary shell."
sudo -s "echo /usr/local/bin/zsh >> /etc/shells" && chsh -s /usr/local/bin/zsh


# Install all browsers requested
echo "Installing selected browsers on to the system"
brew install --cask brave-browser

# Install all editors requested
echo "Installing selected editors on to the system"
brew install --cask visual-studio-code

# Install all tools requested
echo "Installing selected tools on to the system"
brew tap heroku/brew && brew install heroku
brew install --cask caffeine
brew install --cask docker


# Install all databases requested
echo "Installing selected tools on to the system"
brew install mongodb
mkdir -p /data/db
sudo chown -R $USER /data/db

# Install Spotify
echo "Installing selected music streaming service"
brew install --cask spotify

# Install Slack 
echo "Installing selected communitcation tool"
brew install --cask slack 

#Install Discord 
brew install --cask discord

# Install GitKraken
echo "Installing selected communitcation tool"
brew install --cask gitkraken

# Install Grammarly
echo "Installing selected git client"
brew install --cask grammarly

# Install 1Password (Password Manager)
echo "Installing selected password manager"
brew install --cask 1password

# Install Anaconda
echo "Installing selected python distribution platform"
brew install --cask anaconda

# Install Postico
echo "Installing selected database interface"
brew install --cask postico

# Install Paw
echo "Installing selected development tools"
brew install --cask paw

# Installing Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Edex-UI
brew install --cask edex-ui

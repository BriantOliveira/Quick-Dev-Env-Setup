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
brew cask install iterm2

# Install all shells requested
echo "Installing selected shells on to the system"
brew install zsh

# Configuring the shell you selected as your primary shell to be just that
echo "Setting zsh to be your primary shell."
sudo -s "echo /usr/local/bin/zsh >> /etc/shells" && chsh -s /usr/local/bin/zsh


# Install all browsers requested
echo "Installing selected browsers on to the system"
brew cask install google-chrome
brew cask install brave-browser

# Install all editors requested
echo "Installing selected editors on to the system"
brew cask install visual-studio-code

# Install all tools requested
echo "Installing selected tools on to the system"
brew install heroku
brew cask install caffeine
brew cask install docker
brew cask install ngrok
brew cask install postman

# Install all databases requested
echo "Installing selected tools on to the system"
brew install mongodb
mkdir -p /data/db
sudo chown -R $USER /data/db

# Install Spotify
echo "Installing selected music streaming service"
brew cask install spotify

# Install Slack 
echo "Installing selected communitcation tool"
brew cask install slack 

# Install GitKraken
echo "Installing selected communitcation tool"
brew cask install gitkraken

# Install Grammarly
echo "Installing selected git client"
brew cask install grammarly

# Install 1Password (Password Manager)
echo "Installing selected password manager"
brew cask install 1password

# Install Anaconda
echo "Installing selected python distribution platform"
brew cask install anaconda

# Install App Cleaner
echo "Installing selected app cleaner tool"
brew cask install app-cleaner

# Install Fantastical Calendar
echo "Installing selected calendar tool"
brew cask install fantastical

# Install Flotato
echo "Installing selected web tool"
brew cask install flotato

# Install Devdocs
echo "Installing selected documentation tool"
brew cask install devdocs

# Installing Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

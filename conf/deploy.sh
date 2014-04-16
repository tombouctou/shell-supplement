#!/bin/bash

# create std dir structure
function file_install {
	if [ ! -f $2/$1 ]; then
		cp $1 $2/
	fi
}
NOTEXIST=`which wqlatigqhweaugfbsa 2>/dev/null`
#
# system-independent package install
#
function package_install {
	APTGET=`which apt-get 2>/dev/null`
	YUM=`which yum 2>/dev/null`
	BREW=`which brew 2>/dev/null`
	WGET=`which wget 2>/dev/null`
	bold=`tput bold`
	normal=`tput sgr0`
	if [[ ! $APTGET = $NOTEXIST ]]; then
		echo installing ${bold}$1${normal} using apt, you may need to enter password
		sudo apt-get install $1
	elif [[ ! $YUM = $NOTEXIST ]]; then
		echo installing ${bold}$1${normal} using yum, you may need to enter password
		sudo yum install $1
	elif [[ ! $BREW = $NOTEXIST ]]; then
		echo installing ${bold}$1${normal} using homebrew, you may need to enter password
		brew install $1
	elif [[ $1 = 'curl' ]] && [[ ! $WGET = $NOTEXIST ]]; then
		url=http://curl.haxx.se/download/curl-7.22.0.tar.gz
		wget $url
		tar zxf curl-7.22.0.tar.gz
		rm curl-7.22.0.tar.gz
		cd curl-7.22.0
		echo installing curl 7.22 from $url
		./configure && make -j4 && sudo make install
		cd ..
		rm -rf curl-7.22.0.tar.gz
	else
		echo error: unknown package manager
	fi
}

START="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ ! $1 ]]; then
    TARGET=$HOME
else
    TARGET=$1
fi
cd $START
if [[ ! -d "$TARGET" ]]; then
    echo bad target $TARGET
    exit 1
fi

GITCONFIG=$TARGET/.gitconfig
if [[ -e $GITCONFIG ]]; then
	cp $GITCONFIG $GITCONFIG.old
    unlink $GITCONFIG
fi
ln -s $START/.gitconfig $TARGET/
git config --global core.excludesfile $HOME/.gitignore
if [ ! -e $TARGET/.nofinger ]; then
	touch $TARGET/.nofinger
fi
if [ `grep DS_Store $TARGET/.gitignore 2>/dev/null | wc -l` = 0 ]; then
	printf ".DS_Store\nThumbs.db\n" >> $TARGET/.gitignore
fi
BASHRC=$TARGET/.bashrc
if [[ -e $BASHRC ]]; then
	cp $BASHRC $BASHRC.old
    unlink $BASHRC
fi
ln -s $START/.bashrc $TARGET/
#if [[ -e $TARGET/.zshrc ]]; then
#	cp $TARGET/.zshrc $TARGET/.zshrc.old
#fi
VIMRC=$TARGET/.vimrc
if [[ -e $VIMRC ]]; then
	cp $VIMRC $VIMRC.old
    unlink $VIMRC
fi
ln -s $START/.vimrc $TARGET/

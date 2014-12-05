#!/bin/bash -ex
#
# TODO: Rerunnable script
#


SRC_DIR="${HOME}/.src/"
SCRIPT_DIR=$(cd $(dirname "$0") && pwd)

mkdir -p "$SRC_DIR"
cd "$SRC_DIR"

date
echo "starting"


echo "install prerequires"
sudo yum -y update
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install curl dstat ruby lua mercurial


echo "## git ##"
cd "$SRC_DIR"
sudo yum -y install curl-devel expat-devel gettext-devel zlib-devel perl-ExtUtils-MakeMaker xmlto openssl-devel
wget https://www.kernel.org/pub/software/scm/git/git-2.0.4.tar.gz
tar xzf git-2.0.4.tar.gz
cd git-2.0.4

make configure
./configure
make
sudo make install


echo "## zsh ##"
cd "$SRC_DIR"
sudo yum -y install ncurses-devel zlib-devel
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.5/zsh-5.0.5.tar.gz/download -O zsh-5.0.5.tar.gz
tar xzf zsh-5.0.5.tar.gz
cd zsh-5.0.5

./configure
make
sudo make install


echo "## vim ##"
cd "$SRC_DIR"
sudo yum -y install bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel python-devel ruby-devel lua-devel
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xjf vim-7.4.tar.bz2
cd vim74

./configure --disable-selinux --enable-multibyte --with-features=huge --enable-rubyinterp=dynamic --enable-pythoninterp=dynamic --enable-luainterp=dynamic
make
sudo make install


echo "## tmux ##"
echo "### libevent ###"
cd "$SRC_DIR"
sudo yum -y install ncurses-devel
curl -L https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz -o libevent-2.0.21-stable.tar.gz
tar xzf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure
make
sudo make install

cd "$SRC_DIR"
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar xzf tmux-1.9a.tar.gz
cd tmux-1.9a
export LIBEVENT_CFLAGS="-I/usr/local/include"
export LIBEVENT_LIBS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib -levent"
./configure
make
sudo make install


echo "## ag ##"
cd "$SRC_DIR"
sudo yum -y install pcre-devel xz-devel
/usr/bin/git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher
./build.sh
mkdir -p ~/bin/
ln -sf `pwd`/ag ~/bin/


echo "## pt ##"
cd "$SRC_DIR"
wget https://github.com/monochromegane/the_platinum_searcher/releases/download/v1.7.1/pt_linux_amd64.tar.gz
tar xzf pt_linux_amd64.tar.gz
cd pt_linux_amd64
mkdir -p ~/bin/
cp pt ~/bin/


echo "## peco ##"
cd "$SRC_DIR"
wget https://github.com/peco/peco/releases/download/v0.2.3/peco_linux_amd64.tar.gz
tar xzf peco_linux_amd64.tar.gz
cd peco_linux_amd64
mkdir -p ~/bin/
cp peco ~/bin/


echo "## dotfiles ##"
cd "$SCRIPT_DIR"
./setup.sh


date
echo "all done"
exit 0
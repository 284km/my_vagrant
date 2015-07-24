
execute "apt-get update" do
  command "sudo apt-get update"
end

execute "apt-get upgrade" do
  command "sudo apt-get -yV upgrade"
end

execute "apt-get build-dep tmux" do
  command "sudo apt-get build-dep -y tmux"
end

# package "zsh"
# package "git"
# package "build-essential"
# package "vim-gtk"

# %w(zsh git build-essential vim-gtk mercurial build-essential curl tree nkf xsel cmake sysstat siege ipcalc libssl-dev libxslt1-dev libxml2-dev libffi-dev libreadline6 libreadline6-dev rrdtool librrd-dev imagemagick libmagickwand-dev sqlite3 libsqlite3-dev nodejs python-pip python-gpgme autoconf libtool pkg-config subversion subversion-tools libapache2-svn ncurses-term redis-server mysql-server-5.6 libmysqld-dev ).each do |m|
#   package
# end

# mkdir -p ~/bin
# mkdir -p ~/src
# mkdir -p ~/bk
# mkdir -p ~/,



# yum -y install openssl openssl-devel readline-devel zlib-devel curl-devel libyaml-devel flex libxml2-devel zlib-devel libpng-devel libjpeg-devel libXpm-devel freetype freetype-devel

# package 'openssl-devel'
# package 'zlib-devel'
# 
# user 'chkbuild' do
#   username "chkbuild"
#   password "chkbuild"
# end
# 
# package 'mysql-server'
# package 'mysql-devel'
# 
# execute 'rbenv clone' do
#   command "git clone https://github.com/sstephenson/rbenv.git ~chkbuild/.rbenv; echo 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~chkbuild/.bash_profile; echo 'eval \"$(rbenv init -)\"' >> ~chkbuild/.bash_profile"
#   not_if 'test -d ~chkbuild/.rbenv'
# end
# 
# execute 'ruby-build' do
#   command "git clone https://github.com/sstephenson/ruby-build.git ~chkbuild/.rbenv/plugins/ruby-build"
#   not_if 'test -d ~chkbuild/.rbenv/plugins/ruby-build'
# end
# 
# execute 'ruby 2.1.4' do
#   command "~chkbuild/.rbenv/plugins/ruby-build/bin/ruby-build 2.1.4 ~chkbuild/.rbenv/versions/2.1.4"
#   not_if 'test -d ~chkbuild/.rbenv/versions/2.1.4'
# end
# 
# execute 'rbenv chown' do
#   command 'chown -R chkbuild. ~chkbuild/.rbenv'
#   only_if 'test -d ~chkbuild/.rbenv'
# end


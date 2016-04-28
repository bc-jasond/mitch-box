#!/usr/bin/env bash
#disable prompts for things like percona root password
export DEBIAN_FRONTEND=noninteractive

#percona - use the ipv4 only keyserver pool because vagrant/ubuntu 12.04/my home network seems to have issues with ipv6 out of the box
apt-key adv --keyserver ipv4.pool.sks-keyservers.net --recv-keys 1C4CBDCDCD2EFD2A ;
echo "deb http://repo.percona.com/apt trusty main
deb-src http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list.d/percona.list ;
apt-get update ;
apt-get install -y percona-server-server-5.7 percona-server-client-5.7 ;

#node - move to io.js?
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash ;
source /home/vagrant/.bashrc ;
#nvm install iojs ;
nvm install stable ;
npm install npm -g ;

##scala
#apt-get install -y openjdk-7-jdk ;
##run 'activator stage' to download all dependencies, it will create a start script in the ./bin directory called play-scala-mitch
#cd /codebases/play-scala-mitch ; ./activator clean stage ;



#cleanup
apt-get purge -y ;
apt-get autoremove -y ;
apt-get autoclean -y ;

#hosts
echo "192.168.43.10 sandbox" >> /etc/hosts



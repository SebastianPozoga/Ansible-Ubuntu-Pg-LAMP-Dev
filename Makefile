all: download-dependencies

download-dependencies:
	#curl -sS https://ftp.postgresql.org/pub/source/v9.4.1/postgresql-9.4.1.tar.bz2 > sources/postgresql-9.4.1.tar.bz2
	#tar xvf sources/postgresql-9.4.1.tar.bz2 -C /sources/postgresql
	curl -sS https://getcomposer.org/installer > sources/composer_installer.php
	git clone https://github.com/joyent/node.git sources/nodejs
	git --git-dir=sources/nodejs/.git  --work-tree=sources/nodejs checkout v0.12.0

clean:
	rm -Rf sources/*

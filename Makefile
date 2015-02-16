all: clean download mkdir

download: download-pgsql download-composer download-nodejs

mkdir:
    mkdir -p remote/var/www
    mkdir -p remote/etc/apache2/sites-enable

download-pgsql:
	# PgSQL
	git clone git://git.postgresql.org/git/postgresql.git sources/postgres
	tar -zcvf sources/postgres.tar.gz sources/postgres/
	rm -Rf sources/postgres

download-composer:
	# Composer
	wget https://getcomposer.org/installer -O sources/composer_installer.php

download-nodejs:
	# NodeJS
	git clone https://github.com/joyent/node.git sources/nodejs
	git --git-dir=sources/nodejs/.git  --work-tree=sources/nodejs checkout v0.12.0
	tar -zcvf sources/nodejs.tar.gz sources/nodejs/
	rm sources/nodejs -Rf
	chmod 777 sources/* -R

clean:
    # Clean
	rm -Rf sources/*

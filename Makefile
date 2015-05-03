install:
	npm install
	bower install
	curl -s https://www.parse.com/downloads/cloud_code/installer.sh | sudo /bin/bash

build:
	ember build -prod -o /tmp/protoboard-build

parse-app:
	parse new parse-app/

deploy: build parse-app
	rm -rf parse-app/public/*
	mv /tmp/protoboard-build/* parse-app/public/
	cd parse-app; parse deploy

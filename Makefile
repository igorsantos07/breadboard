install:
	npm install
	bower install
	curl -s https://www.parse.com/downloads/cloud_code/installer.sh | sudo /bin/bash

build:
	ember build -prod -o /tmp/protoboard-build

parse-app:
	parse new parse-app/

#TODO: deploy should contain a message with the current git revision code
#TODO: KeepFast should only be called if parse deploy did create a release
deploy: build parse-app
	rm -rf parse-app/public/*
	mv /tmp/protoboard-build/* parse-app/public/
	cd parse-app; parse deploy
	curl http://fast.igorsantos.com.br/schedule -d "url=http%3A%2F%2Fprotoboard.igorsantos.com.br"

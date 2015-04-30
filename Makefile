install:
	npm install
	bower install
	curl -s https://www.parse.com/downloads/cloud_code/installer.sh | sudo /bin/bash
build:
	ember build -prod -o /tmp/protoboard-build

deploy: build
	echo "should deploy after building"

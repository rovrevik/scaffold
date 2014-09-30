#! /bin/bash

#prerequisits
#install brew
#install nvm
#install node

# brew install wget
# gem install compass
# npm install -g protractor
# npm install -g karma-cli
set -x

rm -rf yo_angular

mkdir yo_angular
cd yo_angular
yo angular
git init
git add .
git commit -m "initial commit"

# for now go with the structue used in yeoman and the angular phonecat tutorial for now
mkdir test/e2e

#install protractor things
wget https://raw.githubusercontent.com/rovrevik/scaffold/master/angular/package.json --output-document=package.json
wget https://raw.githubusercontent.com/rovrevik/scaffold/master/angular/test/protractor.conf.js --output-document=test/protractor.conf.js
wget https://raw.githubusercontent.com/angular/protractor/master/example/example_spec.js --directory-prefix=test/e2e
# cp ../package.json package.json
# cp ../test/protractor.conf.js test/protractor.conf.js
# cp ../test/e2e/example_spec.js test/e2e/example_spec.js
npm install

webdriver-manager update
protractor test/protractor.conf.js
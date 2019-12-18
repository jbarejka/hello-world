#!/bin/bash

export SONAR_SCANNER_VERSION=4.2.0.1873
export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-macosx
rm -rf $SONAR_SCANNER_HOME
mkdir -p $SONAR_SCANNER_HOME
curl -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-macosx.zip
unzip $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
rm $HOME/.sonar/sonar-scanner.zip
export PATH=$SONAR_SCANNER_HOME/bin:$PATH
export SONAR_SCANNER_OPTS="-server"

sonar-scanner \
  -Dsonar.projectKey=jbarejka_hello-world \
  -Dsonar.organization=jbarejka \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=a7c965e8ddc1bfce932e112d0b05c49c9a8a7388

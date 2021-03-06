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

mkdir target;
javac *.java -d target;

if [ "$BUILDKITE_PULL_REQUEST" != "false" ]; then
    sonar-scanner \
      -Dsonar.projectKey=jbarejka_hello-world \
      -Dsonar.organization=jbarejka \
      -Dsonar.sources=. \
      -Dsonar.host.url=https://sonarcloud.io \
      -Dsonar.login=a7c965e8ddc1bfce932e112d0b05c49c9a8a7388 \
      -Dsonar.java.binaries=target \
      -Dsonar.pullrequest.key=$BUILDKITE_PULL_REQUEST \
      -Dsonar.pullrequest.branch=$BUILDKITE_BRANCH
    exit 0
fi


sonar-scanner \
  -Dsonar.projectKey=jbarejka_hello-world \
  -Dsonar.organization=jbarejka \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.java.binaries=target \
  -Dsonar.login=a7c965e8ddc1bfce932e112d0b05c49c9a8a7388

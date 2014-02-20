#!/bin/bash

# Pull the version we want to try with the toolkit, checkout the desired branch and compile it
git clone git@github.com:jacomyma/gephi
cd gephi
git checkout "Jacomyma's-Playground"
mvn clean install || exit 1
cd ..

# Adapt the toolkit repo to the corresponding version branch
git checkout 0.8.2
# Set the distant repository to be the local maven installation directory
sed "s/##USER##/$(whoami)/" pom_homebuild.xml > pom.xml
mvn clean install && echo "Toolkit successfully built and available in $pwd/target/"


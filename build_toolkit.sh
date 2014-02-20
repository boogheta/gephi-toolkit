#!/bin/bash

# This should already have been done before or the current file wouldn't even be there
git checkout builder-0.8.2
# Pull the version we want to try with the toolkit, checkout the desired branch and compile it
git clone git@github.com:jacomyma/gephi -b "Jacomyma's-Playground"
cd gephi
mvn clean install || exit 1
cd ..

# Adapt the toolkit repo to the corresponding version branch
# Set the distant repository to be the local maven installation directory
sed "s/##USER##/$(whoami)/" pom_homebuild.xml > pom.xml
mvn clean install && echo "Toolkit successfully built and available in $pwd/target/gephi-toolkit-0.8.2-all.jar"
git checkout -- pom.xml


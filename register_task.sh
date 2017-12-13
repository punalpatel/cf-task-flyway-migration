#!/bin/bash

set -ex

mkdir -p binaries/openjdk-1.8.0_141
cd binaries/openjdk-1.8.0_141
curl https://java-buildpack.cloudfoundry.org/openjdk/trusty/x86_64/openjdk-1.8.0_141.tar.gz | tar xz

# fix for cf, need 644 perm for cf push to work
find . -type f -perm 0444 -exec chmod 644 {} \;

cd ../../
./gradlew build
cp manifest.yml binaries/
cp build/libs/cf-task-flyway-migration-0-SNAPSHOT.jar binaries/
cd binaries
cf create-service p-mysql 100mb mysql
cf push -m 1G cf-task-flyway-migration -b binary_buildpack --no-route --health-check-type 'none' -c "while :; do echo 'Hit CTRL+C'; ls -la; sleep 10; done"
cf stop cf-task-flyway-migration

# don't run the task directly, use oj Scheduler for PCF for that.
#cf run-task cf-task-flyway-migration "./openjdk-1.8.0_141/bin/java -jar cf-task-flyway-migration-0-SNAPSHOT.jar" --name cf-task-flyway-migration-2017-12-11 -m 1G
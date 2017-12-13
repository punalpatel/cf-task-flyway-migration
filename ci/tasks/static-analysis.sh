#!/bin/bash

set -ex

export GRADLE_USER_HOME=$(cd gradle-cache && pwd)
export OWASP_DATA_DIR=$(cd $OWASP_DATA_DIR && pwd)
export VERSION=`./libre-service-tasks/ci/tasks/version.sh`

pushd cf-task-flyway-migration
    ./gradlew test jacocoTestReport dependencyCheckAnalyze -Pversion=$VERSION
    ./gradlew sonarqube -Pversion=$VERSION
popd
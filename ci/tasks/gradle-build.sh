#!/bin/bash

set -ex

export GRADLE_USER_HOME=$(cd gradle-cache && pwd)

pushd cf-task-flyway-migration
    VERSION=`./ci/tasks/version.sh`
    echo "${VERSION}" > ../build-output/version
    ./gradlew build -Pversion=$VERSION

    cp build/libs/cf-task-flyway-migration-$VERSION.jar ../build-output
popd
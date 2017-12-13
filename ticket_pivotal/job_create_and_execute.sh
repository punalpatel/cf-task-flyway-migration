#!/bin/bash

set -ex

cf create-service scheduler-for-pcf standard schedule-test

cf bind-service cf-task-flyway-migration schedule-test

cf create-job cf-task-flyway-migration job-cf-task-flyway-migration "./openjdk-1.8.0_141/bin/java -jar cf-task-flyway-migration-0-SNAPSHOT.jar"

cf run-job job-cf-task-flyway-migration
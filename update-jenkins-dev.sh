#!/bin/bash

. ./venv/bin/activate
jenkins-jobs --conf jenkins_jobs.dev.ini update u-boot.dev.yaml

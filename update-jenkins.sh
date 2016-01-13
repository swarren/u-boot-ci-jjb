#!/bin/bash

. ./venv/bin/activate
jenkins-jobs --conf jenkins_jobs.ini update u-boot.yaml

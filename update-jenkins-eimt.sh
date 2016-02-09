#!/bin/bash

. ./venv/bin/activate
jenkins-jobs --conf jenkins_jobs.eimt.ini update u-boot.eimt.yaml

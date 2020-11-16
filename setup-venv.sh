#!/bin/bash

if [ ! -d venv ]; then
    virtualenv  venv
fi
. ./venv/bin/activate
pip install --upgrade pip
pip install --upgrade jenkins-job-builder

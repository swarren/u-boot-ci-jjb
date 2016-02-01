This repository contains Jenkins job definitions to build and test U-Boot,
using scripts from https://github.com/swarren/u-boot-ci-scripts.

The job definitions are fed into Jenkins Job Builder, which communicates with a
running Jenkins instance and creates/modifies the job definitions.

# One-Time Setup

The job definitions rely on a reasonably recent version of Jenkins Job Builder;
certainly more recent than the version packages in Ubuntu 14.04 for example. To
obtain the most recent version, simply run the following command to create a new
Python virtual environment:

    $ ./setup_venv.sh

In order to run Jenkins Job Builder, a configuration file must be created to
provide login credentials. Create file `jenkins_jobs.ini` with the following
content:

    [job_builder]
    ignore_cache=False

    [jenkins]
    user=your_user_name
    password=your_password
    url=http://localhost:8080/

You will need to adjust the `user`, `password`, and perhaps `url` entries to
match your Jenkins installation. You may find your password (API token) by
logging into the Jenkins user interface, clicking your name/user ID in the
top-right, clicking "Configure" in the menu on the left, and finally clicking
"Show API Token...".

# Reconfiguring Jobs

After editing the YAML configuration files, modifications may be applied to
Jenkins by running:

    $ ./update-jenkins.sh

Jenkins Job Builder is good at adding new or modifying existing job properties.
It is not so good at removing properties that have been removed from the
configuration file. I suggest not removing properties, but simply setting their
value to the new require value if possible. Otherwise, you may need to manually
fix up each job after the update process has completed.

Jenkins Job Builder does not always handle missing YAML properties gracefully. I
suggest making small incremental changes to job definitions, so that if JJB
fails, you have a small set of changes to debug through. In the worst case, you
will need to delete parts of the YAML files until you find the problem, then add
everything back and fix the issue.

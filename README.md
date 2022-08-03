# devops-workspace

Contains various binaries / libraries which are currently being used in DevOps tasks based on Linux Alpine image.

## Tools included

* Terraform
* Ansible
* OpenJDK 17 (LTS)
* Maven
* Gradle
* AWS-CLI

## Prerequisites

- `<.aws path>` - your local .aws folder, this folder contains your AWS credentials
- `<.ssh path>` - your local .ssh folder, this folder contains your ssh credentials
- `<.gradle path>` - your local .gradle folder, this folder contains your gradle cache
- `<.m2 path>` - your local .m2 folder, this folder contains your maven cache
- `<data path>` - your local data path, this folder contains your project workspace (i.e. AWS, Ansible scripts, etc.)
- `<ansible vault path>` - contains the ansible vault password used for your Ansible playbooks

## Running

./devops-workspace.sh
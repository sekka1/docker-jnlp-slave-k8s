Docker jnlp slave for Kubernetes
===================

# Supported tags and respective `Dockerfile` links
## allinone
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/allinone/0.1/Dockerfile)

## gradle
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/gradle/0.1/Dockerfile)

# Description
A Jenkins slave for Kubernetes with additional utililies:

* ssh client (so that you can pull from git via ssh keys)
* docker client
* kubectl
* python virtualenv

## Kubernetes Jenkins Deployment
There are a set of Kubernetes Jenkins deployment files in the `deployment` folder.

There is one manual action.  You have to create a slave then manually populate the
`JENKINS_SECRET` for each slave.

## Building and pushing a versioned container

1. Update the `env_make` file with the new version of what you are going to push
2. run the make push command

        make build-gradle
        make push-gradle

## Slave Containers

### allinone
All in one

#### Contains

* docker client
* kubectl
* python
* node.js
* junit
* bc

### gradle

#### Contains

* gradle

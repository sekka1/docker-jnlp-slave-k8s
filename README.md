Docker jnlp slave for Kubernetes
===================

A Jenkins slave for Kubernetes with additional utililies:

* ssh client (so that you can pull from git via ssh keys)
* docker client
* kubectl
* python virtualenv


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

Docker jnlp slave for Kubernetes
===================

Use with the Jenkins-kubernetes plugin:  https://github.com/jenkinsci/kubernetes-plugin


A Jenkins slave for Kubernetes with additional utililies:

* ssh client (so that you can pull from git via ssh keys)
* docker client
* kubectl
* python virtualenv



## Pushing versioned container

1. Update the `env_make` file with the new version of what you are going to push
2. run the make push command

        make build-gradle
        make push-gradle

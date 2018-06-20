Docker jnlp slave for Kubernetes
===================

## Supported tags and respective `Dockerfile` links
### allinone
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/allinone/0.1/Dockerfile)
- [`0.2` (*0.2/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/allinone/0.2/Dockerfile)
- [`0.3` (*0.3/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/allinone/0.3/Dockerfile)
- [`0.4` (*0.4/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/allinone/0.4/Dockerfile)

### gradle
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/gradle/0.1/Dockerfile)

### k8s
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/k8s/0.1/Dockerfile)
- [`0.2` (*0.2/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/k8s/0.2/Dockerfile)

### Ansible
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/ansible/0.1/Dockerfile)

### Aws
- [`0.1` (*0.1/Dockerfile*)](https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/releases/aws/0.1/Dockerfile)

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
* helm
* AWS CLI
* zip

### gradle

#### Contains

* gradle

### k8s

#### Contains

* kops
* kubectl
* helm

### Ansible

#### Contains

* Ansible

### AWS

#### Contains

* aws-cli

# Usage:

## Docker container
In the Jenkins UI, add a new node.  Name it the same as this param `JENKINS_SLAVE_NODE_NAME` below.

It will give you a secret.  Replace the `JENKINS_SECRET`

```
export SLAVE_NAME=k8s
export SLAVE_VERSION=0.1
export JENKINS_SLAVE_NODE_NAME=worker-k8s-1
export JENKINS_URL=http://jenkins.example.com
export JENKINS_SECRET=d1574b02fd1e0c623055e3e9c515d6d15cec9a442b51b2c3d87fc7b8ce2406a9

docker run -d \
--name ${JENKINS_SLAVE_NODE_NAME} \
-e JENKINS_SECRET=${JENKINS_SECRET} \
-e JENKINS_NAME=${JENKINS_SLAVE_NODE_NAME} \
-e JENKINS_LOCATION_URL=${JENKINS_URL} \
-e JENKINS_URL=${JENKINS_URL} \
-e JENKINS_JNLP_URL=${JENKINS_URL}/computer/${JENKINS_SLAVE_NODE_NAME}/slave-agent.jnlp \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /var/lib/docker/jenkins-scratch:/var/lib/docker/jenkins-scratch \
garland/docker-jnlp-slave-k8s:${SLAVE_NAME}-${SLAVE_VERSION} ${JENKINS_SECRET} ${JENKINS_SLAVE_NODE_NAME}
```

## Kubernetes
In the Jenkins UI, add a new node.

You will have to replace the `JENKINS_SECRET` and `JENKINS_NAME` in the k8s yaml files.

Here is an example of the kubernetes deployment file: https://github.com/sekka1/docker-jnlp-slave-k8s/blob/master/deployment/jenkins_kubernetes/slaves/gradle/1/deployment.yaml

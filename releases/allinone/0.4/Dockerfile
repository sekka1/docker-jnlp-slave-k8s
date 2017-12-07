FROM jenkinsci/jnlp-slave:3.10-1

USER root

WORKDIR /opt

# Add docker client
# The version number is the docker version you want to move to
ENV DOCKER_VERION 17.05.0-ce
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERION}.tgz
RUN tar -zxvf docker-${DOCKER_VERION}.tgz
RUN cp docker/docker /usr/bin/
RUN rm -rf /opt/docker*

# Add kubectl client
ENV KUBECTL_VERSION 1.7.0
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin/

RUN apt-get update

# Change /home/jenkins ownership to root
RUN chown -R root /home/jenkins

# Add python virtualenv and libs
RUN apt-get install -y python-pip python-dev libxml2-dev libxslt1-dev zlib1g-dev
RUN pip install virtualenv

# node.js
# versions: https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs
#RUN apt-get install -y npm nodejs-legacy
RUN npm install -g jasmine-node

# install junit
RUN apt-get install -y junit

# install bc - math expressions
RUN apt-get install -y bc

# Installing envsubst for file variable substitution
RUN apt-get install -y gettext-base

# Installing zip
RUN apt-get install -y zip

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.11.185
RUN apt-get install -y python-pip python-dev build-essential
RUN pip --no-cache-dir install awscli==${AWS_CLI_VERSION}

# Installing helm
# versions: https://github.com/kubernetes/helm#install
ENV HELM_VERSION 2.5.1
RUN wget https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN cp linux-amd64/helm /usr/bin/
RUN rm -rf /opt/helm*

ENTRYPOINT ["jenkins-slave"]

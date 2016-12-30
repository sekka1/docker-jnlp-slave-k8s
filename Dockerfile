FROM jenkinsci/jnlp-slave

USER root

WORKDIR /opt

# Add docker client
ENV DOCKER_VERION 1.12.5
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERION}.tgz
RUN tar -zxvf docker-${DOCKER_VERION}.tgz
RUN cp docker/docker /usr/bin/
RUN rm -rf /opt/docker*

# Add kubectl client
ENV KUBECTL_VERSION 1.5.1
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin/

ENTRYPOINT ["jenkins-slave"]

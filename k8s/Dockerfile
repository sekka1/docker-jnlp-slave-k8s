FROM jenkinsci/jnlp-slave:3.10-1

USER root

WORKDIR /opt

# Add Kops
ENV KOPS_VERSION=1.7.1
RUN wget https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64
RUN chmod +x kops-linux-amd64
RUN mv kops-linux-amd64 /usr/bin/kops

# Add kubectl client
ENV KUBECTL_VERSION 1.7.4
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin/

# Installing helm
# versions: https://github.com/kubernetes/helm#install
ENV HELM_VERSION 2.5.1
RUN wget https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN cp linux-amd64/helm /usr/bin/
RUN rm -rf /opt/helm*

ENTRYPOINT ["jenkins-slave"]

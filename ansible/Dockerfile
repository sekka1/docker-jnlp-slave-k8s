FROM jenkinsci/jnlp-slave:3.10-1

USER root

WORKDIR /opt

RUN apt-get update -y

# Add python virtualenv and libs
RUN apt-get install -y python3-pip build-essential libssl-dev libffi-dev python-dev python3-venv

# add Ansible
ENV ANSIBLE_VERSION=2.4.0.0
RUN pip3 install ansible==${ANSIBLE_VERSION}

ENTRYPOINT ["jenkins-slave"]

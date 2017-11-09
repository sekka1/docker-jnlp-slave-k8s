FROM jenkinsci/jnlp-slave:3.10-1

USER root

RUN apt-get update

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.11.185
RUN apt-get install -y python-pip python-dev build-essential
RUN pip --no-cache-dir install awscli==${AWS_CLI_VERSION}


ENTRYPOINT ["jenkins-slave"]

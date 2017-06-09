FROM jenkinsci/jnlp-slave

USER root

WORKDIR /opt

RUN apt-get update && apt-get install zip

ENV GRADLE_VERSION=3.5

# Installing it manually: https://gradle.org/install#manually
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
RUN unzip gradle-${GRADLE_VERSION}-bin.zip

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/gradle-${GRADLE_VERSION}/bin


ENTRYPOINT ["jenkins-slave"]

FROM jenkinsci/jnlp-slave:3.19-1

USER root

WORKDIR /opt

# Install chrome headless
RUN apt-get update && apt-get install -y libappindicator3-1 fonts-liberation libxss1 lsb-release xdg-utils
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb

USER jenkins

ENTRYPOINT ["jenkins-slave"]

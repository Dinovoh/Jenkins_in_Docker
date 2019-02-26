FROM jenkins/jenkins:lts

MAINTAINER Dmytro Novokhatskyi (dinovoh@gmail.com)

#skip admin pass setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#installing all plugins automatically
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#adding scripts
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/


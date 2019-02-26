# Jenkins in Docker Sandbox
### Prerequisites:
I. Installed:
 - Docker (CE)    -> https://docs.docker.com/install/
 - wget

II. After cloning this repo you need to download:
- Oracle JDK 1.8.0_201 
```sh
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" /
https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz
```
- Apache Maven 3.6.0
```sh 
wget http://apache.ip-connect.vn.ua/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
```
And place them in downloads dir of this project. If some versions are depricated, make shure you'll make some change for example from jenkins UI Manage Jenkins -> Global Tool Configuration -> <your-downloaded-tool>.  

##### Always:
Default user      -> dinovoh
Default passwords -> dinovoh

### Start services
 Make shure you are in the root of this project (Jenkins directory) and Start all docker containers in the next order:
1) To start Jenkins:
```sh
sudo docker run -p 8080:8080 -v `pwd`/downloads:/var/jenkins_home/downloads -v `pwd`/jobs:/var/jenkins_home/jobs/ -v `pwd`/m2_mvn_deps:/var/jenkins_home/.m2/repository/ --rm --name myjenkins -e SONARQUBE_HOST=http://172.18.0.2:9000 myjenkins:latest
```

2) To start SonarQube:
```sh
sudo docker run -d -p 9000:9000 --rm --name mysonar sonarqube
```
3) To start jfrog Artifactory:
```sh
sudo docker run --rm -p 8082:8081 --name artifactory docker.bintray.io/jfrog/artifactory-oss:6.8.2
```

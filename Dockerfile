FROM jenkins/jenkins:jdk11
USER root

RUN apt update -qq

RUN apt -qq -y install \
	podman

COPY dockerhubpw.txt .

RUN podman --storage-driver="vfs" login -u riftember --password-stdin registry.hub.docker.com < dockerhubpw.txt

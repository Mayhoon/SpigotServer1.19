# syntax=docker/dockerfile:1.0.0-experimental
FROM ubuntu
RUN mkdir MinecraftServer
# WORKDIR /MinecraftServer
RUN apt-get update
RUN apt install -y git
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install openjdk-17-jre-headless -y
RUN apt install curl -y
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.19
RUN rm ./BuildTools.jar
RUN git clone https://github.com/Mayhoon/SpigotServer1.19.git
RUN cp -r ./SpigotServer1.19/* .
RUN rm -rf SpigotServer1.19
ENTRYPOINT ["java","-jar","spigot-1.19.jar"]

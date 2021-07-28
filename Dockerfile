FROM ubuntu:latest
RUN mkdir -p /workdir
WORKDIR /workdir
RUN apt update && apt upgrade -y
RUN apt install -y software-properties-common
RUN apt update
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt update
RUN apt install -y build-essential openjdk-11-jdk unzip wget git
COPY build_ghidra.sh /workdir/build_ghidra.sh
ENV GRADLEVERSION "6.0"
RUN wget "https://services.gradle.org/distributions/gradle-${GRADLEVERSION}-bin.zip"
RUN unzip -d /opt/gradle "gradle-${GRADLEVERSION}-bin.zip"
ENV PATH "$PATH:/opt/gradle/gradle-${GRADLEVERSION}/bin"
RUN git clone "https://github.com/NationalSecurityAgency/ghidra"
WORKDIR /workdir/ghidra

# CMD bash
CMD ["../build_ghidra.sh"]

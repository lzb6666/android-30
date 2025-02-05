FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ENV ANDROID_HOME      /opt/android-sdk-linux
ENV ANDROID_SDK_HOME  ${ANDROID_HOME}
ENV ANDROID_SDK_ROOT  ${ANDROID_HOME}
ENV ANDROID_SDK       ${ANDROID_HOME}

ENV PUB_KEY ""

RUN echo "PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/build-tools/30.0.2:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${ANDROID_HOME}/bin" >> /etc/environment && \
    env | grep "ANDROID" >> /etc/environment

RUN apt-get update -yqq && \
    apt-get install -y curl expect git openjdk-11-jdk wget unzip vim rsync openssh-server && \
    apt-get clean

RUN groupadd android && useradd -d /home/android -g android -s /bin/bash -m android

COPY ssh/sshd_config /etc/ssh

COPY tools /opt/tools
COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN chown android:android /opt/android-sdk-linux && \ 
    su android -c "/opt/tools/build.sh"

CMD /opt/tools/entrypoint.sh built-in

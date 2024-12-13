FROM ubuntu:24.10
#
# Requires:
#	Use the qt online installer from https://www.qt.io/download-qt-installer to install a copy of QT6 libs.
# 	Run with --build-arg: docker build --build-arg QT6_INSTALL_DIR=$HOME/Qt-6-6 .


ARG QT6_INSTALL_DIR=QT6
ARG CMAKE_PREFIX_PATH=/owncloud/QT6/6.6.3/gcc_64
ENV CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/owncloud/client-desktop-shell-integration-resources
# ENV ownCloudShellResources_DIR=/owncloud/client-desktop-shell-integration-resources
ENV QT6_INSTALL_DIR=$QT6_INSTALL_DIR
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/owncloud/QT6/Tools/CMake/bin:$PATH

COPY $QT6_INSTALL_DIR /owncloud/QT6
WORKDIR /owncloud
RUN apt update -y && apt install -y git build-essential debhelper lsb-release extra-cmake-modules qmake6 libsqlite3-dev libkf6kio-dev
RUN git clone --depth 1 https://github.com/owncloud/client-desktop-shell-integration-dolphin.git
RUN git clone --depth 1 https://github.com/owncloud/client-desktop-shell-integration-resources.git
WORKDIR /owncloud/client-desktop-shell-integration-resources
RUN cmake --version; cmake .
WORKDIR /owncloud/client-desktop-shell-integration-dolphin
RUN mkdir build
WORKDIR build
RUN cmake .. 

# RUN apt install -y qt6-base-dev	# should not be needed from ubuntu ...

RUN rm -rf /var/lib/apt/lists/*


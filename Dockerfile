FROM ubuntu:20.04

# Definir horario e local
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Pre requisitos
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Usuario
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Colocando o android e arquivos secundarios
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Iniciando android e configurando
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# Instalando Flutter SDK
RUN wget -O flutter.tar.gz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.3-stable.tar.xz
RUN tar -xf flutter.tar.gz && rm flutter.tar.gz
ENV PATH "$PATH:/home/developer/flutter/bin"

# Checando configuração Flutter
RUN flutter doctor
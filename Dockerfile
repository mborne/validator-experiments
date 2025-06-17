FROM ignf-validator

RUN apt-get update \
 && apt-get install -y 7zip unzip wget git \
 && rm -rf /var/lib/apt/lists/*

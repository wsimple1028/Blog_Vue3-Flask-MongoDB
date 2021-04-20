FROM node:latest

WORKDIR /usr/src/app

COPY ./client/vite /usr/src/app

RUN cd /usr/src/app

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential -y \
        curl \
        nmap \
        git \
        nano \
    && rm -rf /var/lib/apt/lists/*

RUN npm install

RUN npm run build

EXPOSE 5000

ENTRYPOINT ["npm", "run", "serve"]

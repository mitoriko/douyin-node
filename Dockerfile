FROM node

#RUN apt-get update && apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev

ADD package.json package.json
ADD node_modules node_modules
ADD server server

WORKDIR /server

EXPOSE 6565

CMD node server.js

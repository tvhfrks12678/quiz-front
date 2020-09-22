FROM node:14.4.0-alpine
# FROM node:lts-alpine

ARG WORKDIR
ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL} \
    NPM_CONFIG_PRODUCTION=false

# ENV check
RUN echo ${HOME}
RUN echo ${CONTAINER_PORT}
RUN echo ${API_URL}

COPY package*.json ./
RUN apk add --no-cache make gcc g++ python 
RUN yarn install

COPY . .

RUN yarn run build

WORKDIR ${HOME}

EXPOSE ${CONTAINER_PORT}
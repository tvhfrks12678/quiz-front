FROM node:14.4.0-alpine
# FROM node:lts-alpine

ARG WORKDIR
ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL}

# RUN apk update && \
#     apk upgrade && \
#     apk add --no-cache make gcc g++ python && \
#     yarn install

RUN apk add --no-cache make gcc g++ python 

# ENV check（このRUN命令は確認のためなので無くても良い）
RUN echo ${HOME}
RUN echo ${CONTAINER_PORT}

WORKDIR ${HOME}

EXPOSE ${CONTAINER_PORT}
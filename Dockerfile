FROM node:24 AS build-base
RUN mkdir -p /build
WORKDIR /build
COPY package*.json ./
RUN yarn

FROM build-base AS build-presentation
ENV SLIDE_NAME="presentation"
COPY ./slides/$SLIDE_NAME .
RUN yarn slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME

FROM build-base AS build-git
ENV SLIDE_NAME="git"
COPY ./slides/$SLIDE_NAME .
RUN yarn slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME

FROM build-base AS build-docker
ENV SLIDE_NAME="docker"
COPY ./slides/$SLIDE_NAME .
RUN yarn slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME

FROM build-base AS build-rest-api
ENV SLIDE_NAME="rest-api"
COPY ./slides/$SLIDE_NAME .
RUN yarn slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME

FROM build-base AS build-ci-cd
ENV SLIDE_NAME="ci-cd"
COPY ./slides/$SLIDE_NAME .
RUN yarn slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME

FROM nginx:1.27.0-alpine
RUN rm -r /usr/share/nginx/html/*
COPY nginx.config /etc/nginx/conf.d/default.conf
COPY --from=build-git /build/build/ /usr/share/nginx/html
COPY --from=build-presentation /build/build/ /usr/share/nginx/html
COPY --from=build-docker /build/build/ /usr/share/nginx/html
COPY --from=build-rest-api /build/build/ /usr/share/nginx/html
COPY --from=build-ci-cd /build/build/ /usr/share/nginx/html

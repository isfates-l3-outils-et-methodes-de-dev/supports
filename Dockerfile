FROM node:22 AS build-base
RUN mkdir -p /build
WORKDIR /build
COPY package*.json ./
RUN npm i
RUN npx playwright install-deps

FROM build-base AS build-git
ENV SLIDE_NAME="git"
COPY ./slides/$SLIDE_NAME .
RUN (trap 'kill 0' SIGINT; \
  (npx slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME) & \
  (npx slidev export ./slides.md --per-slide --output $SLIDE_NAME --timeout 60000 && mkdir -p ./build/pdfs && mv $SLIDE_NAME.pdf ./build/pdfs) & \
  wait)

FROM build-base AS build-presentation
ENV SLIDE_NAME="presentation"
COPY ./slides/$SLIDE_NAME .
RUN (trap 'kill 0' SIGINT; \
  (npx slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME) & \
  (npx slidev export ./slides.md --per-slide --output $SLIDE_NAME --timeout 60000 && mkdir -p ./build/pdfs && mv $SLIDE_NAME.pdf ./build/pdfs) & \
  wait)

FROM build-base AS build-docker
ENV SLIDE_NAME="docker"
COPY ./slides/$SLIDE_NAME .
RUN (trap 'kill 0' SIGINT; \
  (npx slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME) & \
  (npx slidev export ./slides.md --per-slide --output $SLIDE_NAME --timeout 60000 && mkdir -p ./build/pdfs && mv $SLIDE_NAME.pdf ./build/pdfs) & \
  wait)

FROM build-base AS build-rest-api
ENV SLIDE_NAME="rest-api"
COPY ./slides/$SLIDE_NAME .
RUN (trap 'kill 0' SIGINT; \
  (npx slidev build ./slides.md --base /slides/$SLIDE_NAME/ && mkdir -p ./build/slides/$SLIDE_NAME && mv dist/* ./build/slides/$SLIDE_NAME) & \
  (npx slidev export ./slides.md --per-slide --output $SLIDE_NAME --timeout 60000 && mkdir -p ./build/pdfs && mv $SLIDE_NAME.pdf ./build/pdfs) & \
  wait)



FROM nginx:1.27.0-alpine

RUN rm -r /usr/share/nginx/html/*

COPY nginx.config /etc/nginx/conf.d/default.conf
COPY --from=build-git /build/build/ /usr/share/nginx/html
COPY --from=build-presentation /build/build/ /usr/share/nginx/html
COPY --from=build-docker /build/build/ /usr/share/nginx/html

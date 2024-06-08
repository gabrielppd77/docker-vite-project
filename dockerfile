FROM node:18-alpine

ARG CLONE_URL
ARG INTERNAL_PORT

RUN apk add --no-cache git

WORKDIR /app

RUN git clone ${CLONE_URL} .

RUN rm -rf .git

RUN npm ci

COPY project.env .env

RUN npm run build

EXPOSE ${INTERNAL_PORT}

CMD [ "npm", "run", "preview" ]
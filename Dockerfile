# builder : name of this first step
FROM node:16-alpine as builder   

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx 
# nginx will serve the build version
COPY --from=builder /usr/app/build /usr/share/nginx/html
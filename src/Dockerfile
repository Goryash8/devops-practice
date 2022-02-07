FROM node:16-alpine as builder
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./ 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

https://github.com/Goryash8/docker-react.git
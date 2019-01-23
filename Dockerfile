FROM node:alpine as builder
WORKDIR '/app'
# RUN npm config set proxy http://192.168.100.15:80
# RUN npm config set https-proxy http://192.168.100.15:80
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


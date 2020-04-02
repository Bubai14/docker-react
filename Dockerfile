FROM node:alpine as webappbuild
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=webappbuild /app/build /usr/share/nginx/html
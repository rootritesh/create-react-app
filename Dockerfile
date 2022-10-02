#Builder
FROM node:alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build


FROM nginx
WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
COPY --from=build /app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
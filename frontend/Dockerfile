FROM node:14 AS build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:14 AS final
WORKDIR /app


RUN npm install --global http-server


COPY --from=build /app/build ./build


EXPOSE 9000


CMD ["http-server", "-p", "9000", "./build"]
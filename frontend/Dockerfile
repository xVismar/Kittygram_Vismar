FROM node:18 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18
WORKDIR /app
COPY --from=build /app/build ./build
RUN npm install --global http-server
CMD ["npx", "-y", "http-server", "-p", "9000", "/app/build"]
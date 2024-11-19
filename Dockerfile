# Stage 1: Build stage
FROM node:18-slim AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Production stage
FROM node:18-slim

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist /usr/src/app/dist
COPY --from=build /usr/src/app/package*.json /usr/src/app/

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]

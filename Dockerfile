FROM node:20.15.0
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN yarn build
EXPOSE 8080
CMD ["yarn", "start"]
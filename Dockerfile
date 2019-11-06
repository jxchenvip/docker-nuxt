FROM circleci/node:latest-browsers

WORKDIR /usr/src/app/
USER root
COPY package.json ./
RUN yarn

COPY ./ ./

RUN npm i pm2 -g
RUN npm run build

CMD ["npm", "run", "start"]

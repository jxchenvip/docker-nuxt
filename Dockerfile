FROM circleci/node:latest-browsers
WORKDIR /usr/src/app/
USER root
COPY package.json ./
RUN npm install --silent --no-cache --registry=https://registry.npm.taobao.org
COPY ./ ./
RUN npm run build
RUN chmod 777 ./run.sh
CMD ["npm", "run", "start"]

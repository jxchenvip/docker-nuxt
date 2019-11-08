FROM circleci/node:latest-browsers

WORKDIR /usr/src/app/
USER root
COPY package.json ./
RUN yarn
RUN yarn global add pm2
ENV HOST 0.0.0.0

COPY ./ ./

RUN yarn run build

RUN chmod 777 ./run.sh

CMD ["./run.sh"]

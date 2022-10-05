FROM node:14-alpine
WORKDIR /usr/app

RUN mkdir -p /usr/app && apk add --no-cache curl
HEALTHCHECK --interval=1s --timeout=3s --retries=3 CMD curl --fail http://localhost:3000/api/health.json || exit 1  
ENV NODE_ENV production
EXPOSE 3000

# install dependencies before copying app files to enable caching
COPY package.json /usr/app
COPY yarn.lock /usr/app
RUN yarn install --production --frozen-lockfile

# copy app files
COPY . /usr/app
CMD ["npm", "start"]

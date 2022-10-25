FROM node:16-alpine

WORKDIR /usr/src/app

# COPY . .
COPY --chown=node:node . .

#0 8.337 npm notice New minor version of npm available! 8.15.0 -> 8.19.2
#0 8.337 npm notice Changelog: <https://github.com/npm/cli/releases/tag/v8.19.2>
#0 8.338 npm notice Run `npm install -g npm@8.19.2` to update!
  # NOTE: Don't copy if 'new' package-lock.json. If still err:
  # npm install -g npm@8.19.2
  # Del package-lock.json
  # npm i --> new package-lock.json
# RUN npm ci
RUN npm ci --only=production

# Debugging Express
# # ENV DEBUG=playground:*

USER node

# CMD node ./bin/www
CMD ["npm", "start"]

# docker build -t todos-be . # -t for naming
# docker run -p 3000:3000 todos-be # --> container

# docker container ls
# docker kill <first 2 characters at CONTAINER ID col>
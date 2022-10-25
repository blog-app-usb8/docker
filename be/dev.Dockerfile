FROM node:16-alpine

WORKDIR /usr/src/app

# COPY . .
COPY --chown=node:node . .

# Run inside IMAGE 
RUN npm install

# Debugging Express
# # ENV DEBUG=playground:*

# NOTE: For: be hot reload
ENV CHOKIDAR_USEPOLLING=true

USER node

# Run inside CONTAINER
CMD ["npm", "run", "dev"]

# docker build -t food-be-dev . # -t for naming
# docker run -p 3001:3001 food-be-dev # --> container

# docker container ls
# docker kill <first 2 characters at CONTAINER ID col>
FROM node:16-alpine

WORKDIR /usr/src/app

COPY . .

RUN npm install

# ENV REACT_APP_BACKEND_URL=http://localhost:3001/ # After this comment, we'll use it in docker-compose

# NOTE: For: be hot reload
ENV CHOKIDAR_USEPOLLING=true

CMD ["npm", "start"]

# docker build -f ./dev.Dockerfile -t todos-fe-dev .
# docker run -p 3000:3000 todos-fe-dev
# docker run -p 3000:3000 -v "$(pwd):/usr/src/app/" todos-fe-dev
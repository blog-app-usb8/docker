FROM node:16-alpine AS build-stage

WORKDIR /usr/src/app

COPY . .

#0 8.337 npm notice New minor version of npm available! 8.15.0 -> 8.19.2
#0 8.337 npm notice Changelog: <https://github.com/npm/cli/releases/tag/v8.19.2>
#0 8.338 npm notice Run `npm install -g npm@8.19.2` to update!
  # NOTE: Don't copy if 'new' package-lock.json. If still err:
  # npm install -g npm@8.19.2
  # Del package-lock.json
  # npm i --> new package-lock.json
RUN npm ci --only=production

# ENV CI=true 
# RUN npm test

# ENV REACT_APP_BACKEND_URL=http://localhost:3001/
# ENV REACT_APP_BACKEND_URL=http://localhost:8080/api/
# Get build argument and set environment variable
ARG URI
ENV REACT_APP_BACKEND_URL=$URI
# ENV REACT_APP_BACKEND_URL=http://food-be-app:3001 # NOTE: not worked (but worked with nginx, config db/redis in be)

RUN npm run build

# RUN npm install -g serve

# CMD ["serve", "build"]

# -------------------------------------------------------
# # This is a new stage, everything before this is gone, except the files we want to COPY
# FROM nginx:1.20-alpine

# # COPY the directory build from build-stage to /usr/share/nginx/html
# # The target location here was found from the docker hub page
# COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html

# -------------------------------------------------------
# docker build -t food-fe . # -t for naming
# docker run -p 3000:3000 food-fe # --> container ERR after use nginx
# docker run -p 80:80 food-fe # --> container

# -------------------------------------------------------
FROM node:16-alpine

ENV PORT 3000

RUN npm install -g serve

# COPY --from=build-stage /app/build /usr/src/html
COPY --from=build-stage /usr/src/app/build .

# CMD serve -l $PORT /usr/src/html
CMD serve -l $PORT
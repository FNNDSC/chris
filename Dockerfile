# Docker >= 17.05 needed! https://docs.docker.com/engine/userguide/eng-image/multistage-build/

#
# Stage 1 - build the app
#
FROM node:8.9

# Install polymer cli
RUN npm install -g bower polymer-cli --unsafe-perm 

# Copy current directory into /chris
ADD . /chris

# Set working direcrory
WORKDIR /chris

# Install bower packages
RUN bower install --allow-root

# Build the app
RUN polymer build

#
# Stage 2 - serve the build
#
FROM mhart/alpine-node:8.6.0

COPY --from=0 /chris/build/es5-bundled /app

WORKDIR /app

RUN yarn add serve

# Start dev server
EXPOSE 8081
# sed -i '' 's/__CUBE_IP__/myglobalvar/' /app/src/chris-app.html
# sed -i '' 's/__CUBE_PORT__/anothervar/' /app/src/chris-app.html
CMD ./node_modules/serve/bin/serve.js -p 8081 .

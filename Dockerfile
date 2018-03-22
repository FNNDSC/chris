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

# https://stackoverflow.com/questions/40334751/dockerfile-overriding-env-variable

FROM mhart/alpine-node:8.6.0

COPY --from=0 /chris/build/es5-bundled /app

ENV CUBE_IP="http://localhost"
ENV CUBE_PORT="8001"

WORKDIR /app

RUN yarn global add polymer-cli

# Start dev server
EXPOSE 8081

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD polymer serve --hostname 0.0.0.0 -p 8081 .
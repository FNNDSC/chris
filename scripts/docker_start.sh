if [ -z "$1" ]; then
  echo "Give me the port we want to connect to the dock, i.e 8081"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Give me the docker tag we want to run, i.e fnndsc/chris:01"
  exit 1
fi

docker ps&& \
# we use --name se we can force removing of container started with --restart=always
# https://stackoverflow.com/a/38225298/2568650
(docker rm chris -f || true) && \
docker run --restart=always -d -p $1:8081 --name chris $2
if [ -z "$1" ]; then
  echo "Give me the docker tag as input, e.g. fnndsc/chris:0.1"
  exit 1
fi

bash $(dirname "$0")//docker_build.sh $1

docker push $1
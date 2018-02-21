if [ -z "$1" ]; then
  echo "Give me the docker tag as input, e.g. chris:0.1"
  exit 1
fi

docker build -t $1 .
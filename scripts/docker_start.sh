if [ -z "$1" ]; then
  echo "Give me the port we want to connect to the dock, i.e 8081"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Give me the docker tag we want to run, i.e fnndsc/chris:01"
  exit 1
fi

# CUBE IP
# if 3rd argument was provided, override default
cube_ip="http://localhost"
if ! [ -z "$3" ]; then
	cube_ip="$3"
fi

# CUBE PORT
# if 4th argument was provided, override default
cube_port="8000"
if ! [ -z "$4" ]; then
	cube_port="$4"
fi

rav_location="http://localhost:8001"
if ! [ -z "$5" ]; then
	rav_location="$5"
fi

docker ps&& \
# we use --name se we can force removing of container started with --restart=always
# https://stackoverflow.com/a/38225298/2568650
(docker rm chris -f || true) && \
docker run --restart=always -e "CUBE_IP=${cube_ip}" -e "CUBE_PORT=${cube_port}" -e "RAV_LOCATION=${rav_location}" -d -p $1:8081 --name chris $2
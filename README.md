# Chris

Project was initiated with the Google PSK.

Official front end for CUBE.

## Dev setup

Developer setup.

``` bash
bower install
polymer serve
```

## Styling and theming

Styling.

## Build new dock

``` bash
./scripts/docker_build.sh fnndsc/chris:0.2
```

## Build and push dock to Dockerhub

``` bash
./scripts/docker_deploy.sh fnndsc/chris:0.2
```

## Run dock

``` bash
./scripts/docker_start.sh 8081 chris:02 http://localhost 8001 <OPTIONAL:CUBE_IP, i.e. http://localhost> <OPTIONAL:CUBE_PORT, i.e. 8000>
```
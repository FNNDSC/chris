#!/bin/sh

sed -i.bak "s~__CUBE_IP__~$CUBE_IP~" /app/src/chris-app.html
sed -i.bak "s~__CUBE_PORT__~$CUBE_PORT~" /app/src/chris-app.html
sed -i.bak "s~__RAV_LOCATION__~$RAV_LOCATION~" /app/src/chris-app.html

exec "$@"
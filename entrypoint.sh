#!/bin/sh

echo "$CUBE_IP"
sed -i.bak "s~__CUBE_IP__~$CUBE_IP~" /app/src/chris-app.html
sed -i.bak "s~__CUBE_PORT__~$CUBE_PORT~" /app/src/chris-app.html

exec "$@"
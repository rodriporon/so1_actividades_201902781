GITHUB_USER="rodriporon"
ID=$(curl -s "https://api.github.com/users/$GITHUB_USER" | jq -r '.id')
CREATED_AT=$(curl -s "https://api.github.com/users/$GITHUB_USER" | jq -r '.created_at')
MESSAGE="Hola $GITHUB_USER. USER ID: $ID. Cuenta fue creada el: $CREATED_AT"
date=$(date +%d-%m-%y)
echo $MESSAGE

[ -d /tmp/$date ] && cd /tmp/$date || mkdir /tmp/$date && cd /tmp/$date

echo $MESSAGE > saludos.log
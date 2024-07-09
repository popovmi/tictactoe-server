ENVIRONMENT=$1

echo "Prepare deployment for env: $ENVIRONMENT"

NAMESPACE=popovmi-tictactoe-$ENVIRONMENT
HOSTNAME=api.$NAMESPACE.localtest.me

sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/volume.yml | kubectl apply -f -

sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" \
  -e "s~{{SERVER_IMAGE}}~$SERVER_DOCKER_IMAGE:$CI_COMMIT_SHORT_SHA~g" \
  -e "s/{{CORS_ORIGIN}}/$CORS_ORIGIN/g" \
  kuber/server.yml | kubectl apply -f -

sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" \
  -e "s/{{HOSTNAME}}/$HOSTNAME/g" \
  kuber/ingress.yml | kubectl apply -f -

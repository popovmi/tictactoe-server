STAGE=$1

if [[ $STAGE == "main" ]]; then
  STAGE="prod"
fi

echo "STAGE: $STAGE"

NAMESPACE=popovmi-tictactoe-$STAGE

sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/volume.yml | kubectl apply -f -
sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" -e "s~{{SERVER_IMAGE}}~$SERVER_DOCKER_IMAGE:$CI_COMMIT_SHORT_SHA~g" kuber/server.yml | kubectl apply -f -
sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/ingress.yml | kubectl apply -f -

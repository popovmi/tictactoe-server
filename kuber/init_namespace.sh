STAGE=$1

if [[ $STAGE == "main" ]]; then
  STAGE="prod"
fi

echo "STAGE: $STAGE"

NAMESPACE=popovmi-tictactoe-$STAGE

kubectl create namespace $NAMESPACE

sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/volume.yml | kubectl apply -f -
sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" -e "s~{{SERVER_IMAGE}}~popovmi/tictactoe-server~g" kuber/server.yml | kubectl apply -f -
sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/ingress.yml | kubectl apply -f -

STAGE=$1

if [[STAGE == "main"]]; then
  STAGE = "prod"
fi

echo "STAGE: $STAGE"

NAMESPACE=popovmi-tictactoe-$STAGE

kubectl create namespace $NAMESPACE

sed "s/{{NAMESPACE}}/$NAMESPACE/g" volume.yaml | kubectl apply -f -
sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" -e "s~{{SERVER_IMAGE}}~popovmi/tictactoe-server~g" server.yaml | kubectl apply -f -
sed "s/{{NAMESPACE}}/$NAMESPACE/g" ingress.yaml | kubectl apply -f -

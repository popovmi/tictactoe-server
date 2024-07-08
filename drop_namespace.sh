STAGE=prod
NAMESPACE=popovmi-tictactoe-$STAGE

sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/ingress.yaml | kubectl delete -f -
sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" -e "s~{{SERVER_IMAGE}}~popovmi/tictactoe-server~g" kuber/server.yaml | kubectl delete -f -
sed "s/{{NAMESPACE}}/$NAMESPACE/g" kuber/volume.yaml | kubectl delete -f -

kubectl delete namespace $NAMESPACE

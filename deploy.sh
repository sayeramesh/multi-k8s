docker build -t sayerameshbabu/multi-client -f ./client/Dockefile ./client
docker build -t sayerameshbabu/multi-server -f ./server/Dockerfile ./server
docker build -t sayerameshbabu/multi-worker -f ./worker/Dockerfile ./worker
docker push sayerameshbabu/multi-client
docker push sayerameshbabu/multi-server
docker push sayerameshbabu/multi-worker
kubectl apply -f k8s
kubectl set image Deployment/client-deployment 
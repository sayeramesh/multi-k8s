docker build -t sayerameshbabu/multi-client:latest -t sayerameshbabu/multi-cliet:$SHA -f ./client/Dockefile ./client
docker build -t sayerameshbabu/multi-server:latest -t sayerameshbabu/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sayerameshbabu/multi-worker:latest -t sayerameshbabu/multi-worker:$SHA  -f ./worker/Dockerfile ./worker

docker push sayerameshbabu/multi-client:latest
docker push sayerameshbabu/multi-client:$SHA

docker push sayerameshbabu/multi-server:latest
docker push sayerameshbabu/multi-server:$SHA

docker push sayerameshbabu/multi-worker:latest
docker push sayerameshbabu/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image Deployments/client-deployment client=sayerameshbabu/multi-client:$SHA
kubectl set image  Deployments/server-deployment server=sayerameshbabu/multi-server:$SHA
kubectl set image Deployments/worker-deployment worker=sayerameshbabu/multi-worker:$SHA

#!/bin/bash

echo "Criando as imagens.........."

docker build -t renatocampoy/projeto-backend:1.0 backend/.
docker build -t renatocampoy/projeto-database:1.1 database/.

echo "Realizando o push das imagens....."

docker push renatocampoy/projeto-backend:1.0
docker push renatocampoy/projeto-database:1.1

echo "Criando serviços do clueter kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

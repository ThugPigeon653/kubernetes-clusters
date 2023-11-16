@ECHO OFF
REM The ps1 script installs minikube and sets up PATH. The rest of this script just launches a cluster and starts the dashboard. 
REM Replace the application in web-app/, and that app will be launched on the cluster
powershell -ExecutionPolicy Bypass -File "%CD%\minikube-setup.ps1"
cd web-app
docker login
docker build -t thugpigeon653/lneilsen-demo:latest .
docker push thugpigeon653/lneilsen-demo:latest
cd ..
minikube stop
minikube config set driver docker
minikube delete
minikube start --memory=4096 --cpus=2
call minikube -p minikube docker-env
echo Deleting existing deployment...
minikube kubectl -- delete deployment single-minikube
echo Creating deployment...
minikube kubectl -- create deployment single-minikube --image=thugpigeon653/lneilsen-demo:latest
minikube kubectl -- expose deployment single-minikube --type=NodePort --port=5000
minikube kubectl -- get service single-minikube
minikube dashboard 
echo PRESS ANY KEY TO STOP MINIKUBE
pause
minikube kubectl -- delete deployment single-minikube
minikube stop

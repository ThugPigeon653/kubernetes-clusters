
REM The ps1 script installs minikube and sets up PATH. The rest of this script just launches a cluster and starts the dashboard. 
REM Replace the application in web-app/, and that app will be launched on the cluster
powershell -ExecutionPolicy Bypass -File "%CD%\minikube-setup.ps1"
cd web-app
docker context use default
docker login
docker build -t thugpigeon653/lneilsen-demo:latest .
docker push thugpigeon653/lneilsen-demo:latest
minikube config set driver docker
minikube stop
minikube delete
minikube start --memory=4096 --cpus=2
call minikube -p minikube docker-env
minikube kubectl -- create configmap nginx-config --from-file=./
echo Creating deployment...
timeout /t 10 /nobreak >nul
minikube kubectl -- apply -f ../multi-pod.yaml
timeout /t 10 /nobreak >nul
minikube kubectl -- get deployment multi-pod
minikube kubectl -- expose deployment multi-pod --type=NodePort --port=5000
minikube kubectl -- get service multi-pod
minikube dashboard &
minikube service multi-pod &
echo PRESS ANY KEY TO STOP MINIKUBE
pause
minikube stop

REM The ps1 script installs minikube and sets up PATH. The rest of this script just launches a cluster and starts the dashboard. 
REM Replace the application in web-app/, and that app will be launched on the cluster
powershell -ExecutionPolicy Bypass -File "%CD%\minikube-setup.ps1"
cd web-app
docker build -t web-app/py-app .
cd ..
kubectl get deployment hello-minikube > nul 2>&1
if %errorlevel% neq 0 (
    echo Creating deployment...
    kubectl create deployment hello-minikube --image=web-app/py-app:latest
) else (
    echo Deployment already exists.
)
kubectl get service hello-minikube > nul 2>&1
if %errorlevel% neq 0 (
    echo Creating service...
    kubectl expose deployment hello-minikube --type=NodePort --port=8080
) else (
    echo Service already exists.
)
kubectl get services hello-minikube
minikube service hello-minikube
minikube dashboard
pause
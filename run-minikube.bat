REM The ps1 script installs minikube and sets up PATH. The rest of this script just launches a cluster and starts the dashboard. Replace the image with any docker image
powershell -ExecutionPolicy Bypass -File "%CD%\minikube-setup.ps1"
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl get services hello-minikube
minikube service hello-minikube
minikube dashboard
pause
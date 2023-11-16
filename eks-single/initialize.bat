@ECHO OFF
REM The ps1 script installs minikube and sets up PATH. The rest of this script just launches a cluster and starts the dashboard. 
REM Replace the application in web-app/, and that app will be launched on the cluster
aws cloudformation create-stack --stack-name eks-infrastructure --template-body file://cluster.yaml --region ap-southeast-2 --capabilities CAPABILITY_NAMED_IAM
cd web-app
docker login
docker build -t thugpigeon653/lneilsen-demo:latest .
docker push thugpigeon653/lneilsen-demo:latest
cd ..
aws s3 mb s3://eks-infrastructure
aws s3 cp cluster.yaml s3://eks-infrastructure/cluster.yaml
echo Deleting existing deployment...
echo Creating deployment...
kubectl create deployment single-eks --image=thugpigeon653/lneilsen-demo:latest
kubectl expose deployment single-eks --type=NodePort --port=5000
echo PRESS ANY KEY TO STOP AND REMOVE CLUSTER
pause
aws s3api delete-bucket --bucket eks-infrastructure
aws cloudformation delete-stack --stack-name eks-infrastructure --region ap-southeast-2

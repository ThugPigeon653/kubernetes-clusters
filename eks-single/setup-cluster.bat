aws eks --region ap-southeast-2 update-kubeconfig --name eks-infrastructure
kubectl create deployment single-eks --image=thugpigeon653/lneilsen-demo:latest
kubectl expose deployment single-eks --type=NodePort --port=5000
aws s3api delete-objects --bucket eks-infrastructure --delete Objects=[{Key=cluster.yaml}]
aws s3api delete-bucket --bucket eks-infrastructure
aws cloudformation delete-stack --stack-name eks-infrastructure --region ap-southeast-2
ABOUT:
----------------------------------------------------------------------
This workflow sets up and inititializes a small AWS EKS cluster, using
cloudformation. Scripts have also been provided to ssetup the cluster
once the infrastructure is provisioned. 
Like other workflows in this repo, the application in web-app is what 
will be dockerized and deployed to the new cluster.

PRE-START:
----------------------------------------------------------------------
Make sure you have AWS CLI installed and configured, as well as docker
installed, running and configured. It is assumed your cli is setup
with a role capable of deploying the cloudformation template.

USAGE (workflow):
----------------------------------------------------------------------
A manually scripted workflow is available in workflow.py, but is not 
fully complete. Running it will provision infrastructure through 
cloudformation, but has not yet been setup to finish the deployment 
pipeline. 
TODO: This workflow just needs to run the bat scripts in the order 
specified below. It would really be more effective just to use a CICD
tool.

USAGE (manual - with scripts):
----------------------------------------------------------------------
1. Run inititialize.bat. This will setup your EKS nodes and associated
infrastructure. It will also create an image from web-app.
2. Wait for cloudformation to finish provisioning the stack. This can 
be checked through the console, or by running cfn-status.bat.
3. Run setup-cluster.bat. This will deploy the application to the new
cluster.

CLEANUP:
----------------------------------------------------------------------
Run cleanup.bat. This will delete the S3 bucket which was provisioned,
as well as any resources under the cloudformation stack. 
Once complete, check the cloudformation stack does successfully delete
all resources. Also check the eks-infrastructure bucket is gone from 
your S3.
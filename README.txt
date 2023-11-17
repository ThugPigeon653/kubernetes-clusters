ABOUT:
----------------------------------------------------------------------
This repository features a few approaches to deploying web apps to 
Kubernetes. Each folder includes a readme, which gives a more detailed
view on what each cluster does, and how the infrastructure is deployed.
The 'single' deployments are a direct web-app:service relationship, 
where the 'multi' deployments consist of a publicly-exposed server, 
and a private web application.
Each folder is prefixed with the environment type (i.e. minikube, eks).

BEFORE GETTING STARTED:
----------------------------------------------------------------------
Each of these quickstart programs handles download, installation, and
initialization of dependancies and infrastructure. The requirement is
a running/configured docker service.
This is designed for windows, and has been tested using Win10 and 
Docker Desktop.
EKS examples also require a little more setup, which is detailed in the
respective readme's. 

GETTING STARTED:
----------------------------------------------------------------------
Run initialize.bat in any of these folders - that's it. Other .bat 
files can be run as soon as the cluster is fully running.
The best way to implement any of these solutions would be to run these
scripts from hooks of an automation tool. 
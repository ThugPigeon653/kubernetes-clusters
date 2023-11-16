ABOUT:
----------------------------------------------------------------------
This deployment creates and deploys a pod using two images. Like the 
quickstart in minikube-single/ this app builds, pushes, and uses the 
application in web-app/. The difference is that this implementation 
serves our web app using the nginx image, which can communicate locally 
with our private web app. This means that the data/backend logic does 
not need to be publicly exposed, but can still control what is publicly 
served. 

USAGE:
----------------------------------------------------------------------
1. Run the inititialize batch script in this folder. Wait for the 
dashboard to appear, and the deployment to be available. Do not move
to the next step until your deployment is complete (it will go green
in the dashboard).
2. Run view-service batch script. This will open the url to your new 
service in the default web browser. As mentioned before, this will not
work until the deployment is complete.
ABOUT:
----------------------------------------------------------------------
This deployment creates and deploys a pod from a single image. This is
is done by dockerizing the application in web-app.py - a sample flask 
app has been included to prove functionality. The service exposes the
flask app directly.

USAGE:
----------------------------------------------------------------------
1. Run the inititialize batch script in this folder. Wait for the 
dashboard to appear, and the deployment to be available. Do not move
to the next step until your deployment is complete (it will become 
green).
2. Run view-service batch script. This will open the url to your new 
service in the default web browser. As mentioned before, this will not
work until the deployment is complete.
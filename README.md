# Let's Chat on Bluemix Overview

This repository will show you how to run the open-source [_Let's Chat_](http://sdelements.github.io/lets-chat/) application on IBM Containers in IBM Bluemix.  The provided Dockerfiles, scripts, and pipeline file will build & deploy the necessary Docker images for the Let's Chat application and an nginx load-balancer and link the running containers to a MongoDB service instance in IBM Bluemix.

IBM Containers is an Enterprise-grade Docker container service, available on IBM Bluemix.  Provided here are all the necessary artifacts to build and deploy the sample application and deploy it on IBM Containers, leveraging additional IBM Bluemix services where appropriate.  As additional capabilities are made available through IBM Bluemix, this sample application repository will be updated to take advantage of them as appropriate.

## One-click deploy
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)

## How it works
I'll let the [SD Elements](http://sdelements.github.io/lets-chat/) team describe Let's Chat here:
> Let's Chat is a persistent messaging application that runs on Node.js and MongoDB. It's designed to be easily deployable and fits well with small, intimate teams.

Similar to Slack, it's quick to start and even simpler to use.  Once the application is deployed, follow the steps below to start collaborating with your teammates or audience immediately!

_TBD Architecture Diagram_

**Pre-requisites:**
1. An active IBM Bluemix account.  It can be a trial account.

2. An active Space inside your IBM Bluemix Organization that is configured to use IBM Containers.

**Sample application walkthrough**

1. Step 1
 
2. Step 2

3. Step 3

## Repository structure
_TBD Document the repository structure and how the artifacts interact_

## Running the app on Bluemix
Let's Chat is a straight-forward NodeJS application, requiring only a MongoDB as its sole datastore.  IBM Bluemix provides you with all the necessary services to run Let's Chat with minimal management overhead.  Instead of deploying and managing your own MongoDB server, this sample application leverages one of the available MongoDB services available on Bluemix today.  The provided build pipeline then dynamically links the running container instances with the available MongoDB service instance at deploy time, making this a very portable and repeatable deployment process.

To deploy the sample application, follow the steps below or click the **Deploy to Bluemix** button above.  Alternatively, fork this project and make your own changes to the Dockerfiles, supporting scripts, or pipeline file for more extra-credit work.

1. Step 1
 
2. Step 2
	* Substep (a)
	* Substep (b)
3. Step 3

	```
	Your code here
	```

## Run the app locally
_TBD How to run locally and still leverage Bluemix services dynamically!_

## API documentation
There is no API made available through this sample application.

### Useful links
#### IBM Bluemix
* [IBM Bluemix](https://bluemix.net/)  
* [IBM  Bluemix Documentation](https://www.ng.bluemix.net/docs/)  
* [IBM Bluemix Developers Community](http://developer.ibm.com/bluemix)

#### IBM Containers
* [IBM Containers](https://console.ng.bluemix.net/solutions/open-architecture/)
* _TBD_

_Let's Chat on Bluemix_ is a sample application created for the purpose of demonstrating a Docker application on IBM Containers. The program is provided as-is with no warranties of any kind, express or implied. 
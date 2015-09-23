# Let's Chat on Bluemix Overview

![Let's Chat](https://camo.githubusercontent.com/59e42ea1b29e58a290557dd2425931eec1185e78/687474703a2f2f692e696d6775722e636f6d2f3061336c3556462e706e67)  
![IBM Containers](https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSwFL7rmMXcMDxIM0m0hiLPwJFeE23l3puGJj78bjPBYhQ78xvcZw)  

This repository will show you how to run the open-source [_Let's Chat_](http://sdelements.github.io/lets-chat/) application on IBM Containers in IBM Bluemix.  The provided Dockerfiles, scripts, and pipeline file will build & deploy the necessary Docker images for the Let's Chat application and an nginx load-balancer and link the running containers to a MongoDB service instance in IBM Bluemix.

IBM Containers is an Enterprise-grade Docker container service, available on IBM Bluemix.  Provided here are all the necessary artifacts to build and deploy the sample application and deploy it on IBM Containers, leveraging additional IBM Bluemix services where appropriate.  As additional capabilities are made available through IBM Bluemix, this sample application repository will be updated to take advantage of them as appropriate.

<!---
## One-click deploy
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy)
--->

## How it works
I'll let the [SD Elements](http://sdelements.github.io/lets-chat/) team describe Let's Chat here:
> Let's Chat is a persistent messaging application that runs on Node.js and MongoDB. It's designed to be easily deployable and fits well with small, intimate teams.

Similar to Slack, it's quick to start and even simpler to use.  Once the application is deployed, follow the steps below to start collaborating with your teammates or audience immediately!

_TBD Architecture Diagram_

1. Step 1
 
2. Step 2

3. Step 3

## Repository structure
_TBD Document the repository structure and how the artifacts interact_

## Running the app on Bluemix
Let's Chat is a straight-forward NodeJS application, requiring only a MongoDB as its sole datastore.  IBM Bluemix provides you with all the necessary services to run Let's Chat with minimal management overhead.  Instead of deploying and managing your own MongoDB server, this sample application leverages one of the available MongoDB services available on Bluemix today.  The provided build pipeline then dynamically links the running container instances with the available MongoDB service instance at deploy time, making this a very portable and repeatable deployment process.

To deploy the sample application, follow the steps below or click the **Deploy to Bluemix** button above.  This walkthrough will make use of the IBM Bluemix DevOps Services Delivery Pipeline capability to build the Docker images and deploy them to running container instances on IBM Containers.  You can also perform the same activities via the IBM Containers command line (_cf ic_) if desired.

### Setup Bluemix pre-requisites
1. Create a Bluemix Account  
[Sign up][bluemix_signup_url] for Bluemix, or use an existing account.
2. Enable your Bluemix Account for usage of IBM Containers  (_Optional_ - only required if not already completed)  
Select an existing Space or create a new one in the Bluemix Dashboard and click **START CONTAINERS**.  You will be prompted to create a private Docker registry in Bluemix.  
**Note:** This cannot be changed once it is created.  So keep it short and confined to something you wouldn't be embarrassed to share with your peers.
3.  Create the Bluemix bridge application  
 1.  This can be done from either the Bluemix UI or from the CloudFoundry CLI.
 2.  This walkthrough will use the name _lets-chat-bridge_ for reference.  Make note of the name used, as it will be needed to bind the container instances to later on.
4.  Create the MongoDB service instance  
 1.  This can be done from either the Bluemix UI or from the CloudFoundry CLI.  
 2.  Select the **MongoLab** service type and the **Sandbox** plan.  
 **Note:**  Any type of MongoDB service is usable, however the MongoLab service is used here due to it's simplicity of initial user onboarding.  As the recently-acquired Compose.IO offerings are more tightly integrated into the Bluemix experience, this sample application will be updated to use those instead.
 3.  If you are in the Bluemix UI and prompted to restage your application, click **RESTAGE** and wait a few moments for your application to be running again.

### Create your Bluemix DevOps Services project
5.  Fork the [current repository][current_repo_url].
6.  Login to [Bluemix DevOps Services][devops_services_url] and create a new project.
7.  Enter a name for your new project.  _lets-chat-demo_ will be used here for reference.
8.  Select **Link to an existing GitHub repository** and **Link to a Git repo on GitHub**.  Select the newly forked repository.  
9.  Ensure under **Make this a Bluemix Project**, that the space selected is the space you deployed your bridge application to above.  
10.  Click **CREATE** and wait for your Bluemix DevOps Services project to be created.  Now whenever any changes are made in your forked GitHub repository, they will flow into this project and kick off the Delivery Pipeline you will configure in the next step.

### Configure the Delivery Pipeline
Only one of the Delivery Pipeline walkthroughs below is necessary.  You do not need to do both of them.

#### Configure a Basic Delivery Pipeline
> Use this Basic Pipeline to deploy a single Let's Chat container with a public IP, accessed via http://{public_ip}:8080  

11.  Once created, go to the **BUILD & DEPLOY** tab of your project.  
12.  Create a **Build** stage & associated job with the following properties:
  1.  **Builder Type:**  IBM Container Service  
  2.  **Space:**  Your container-enabled space configured in Step 2 
  3.  **Image Name:**  lets-chat-bmx  
  3.  **Build Script:**  Use this [lets-chat-build.sh][gist_lets_chat_build_url] gist
13.  Create a **Deploy** stage & associated job with the following properties:
  1.  **Deployer Type:** IBM Containers on Bluemix
  2.  **Space:**  Your container-enabled space configured in Step 2  
  3.  **Name:** lets-chat-single
  4.  **Port:**  8080,5222
  5.  **Deployer Script:**  The default deployer script is acceptable.
  6.  **Environment Properties**  
    1.  **BIND_TO**  lets-chat-bridge  
	2.  **CONTAINER_SIZE**  tiny
14.  This pipeline will now build whenever a commit is pushed to the forked repository.  Optionally, you can click the **Run Stage** button in the Build stage to kick off the delivery pipeline.  
15.  Once the Build and Deploy stages have completed successfully, you can access the running Let's Chat server by the public IP address assigned.  This is available through the log of the deploy stage, the Bluemix UI, or the '''cf ic ip list''' command.

#### Configure an Advanced Delivery Pipeline
> Use this Advanced Pipeline to deploy two Let's Chat containers and one nginx container handling the load-balancing across them, accessed via http://{nginx_public_ip}  

11.  Once created, go to the **BUILD & DEPLOY** tab of your project.  
12.  TBD Configure advanced build and deploy of lets-chat & nginx

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

[bluemix_signup_url]: https://console.ng.bluemix.net/?cm_mmc=Display-GitHubReadMe-_-BluemixSampleApp-LetsChat-_-Docker-_-BM-Containers
[bluemix_catalog_url]: https://console.ng.bluemix.net/catalog/
[bluemix_dashboard_url]: https://console.ng.bluemix.net/?direct=classic/#/resources
[devops_services_url]: https://hub.jazz.net/
[cloud_foundry_url]: https://github.com/cloudfoundry/cli
[current_repo_url]: https://github.com/osowski/lets-chat-bluemix
[gist_lets_chat_build_url]: https://gist.github.com/osowski/8dca076ac07b5069aabe#file-lets-chat-build-sh
# Let's Chat on Bluemix Overview

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
2. Enable your Bluemix Account for usage of IBM Containers  (_Optional - only required if not already completed)  
Select an existing Space or create a new one in the Bluemix Dashboard and click _Start Containers_.  You will be prompted to create a private Docker registry in Bluemix.  
**Note:** This cannot be changed once it is created.  So keep it short and confined to something you wouldn't be embarrassed to share with your peers.
3.  Create the Bluemix bridge application  
 1.  From the [Bluemix Dashboard][bluemix_dashboard_url], click **CREATE APP**.  
 2.  Select the **WEB** and **SDK for Node.js** and click **CONTINUE**.  
 3.  Enter an application name that you will use to bind the container instances to.  This walkthrough will use _lets-chat-bridge_ for reference.  
 4.  Click **FINISH**  
4.  Create the MongoDB service instance  
 1.  From the [Bluexmix Catalog ][bluemix_catalog_url], search for **mongolab** and select **View More**.  
 2.  Select your newly deployed app from Step 3 in the _App:_ dropdown and click **CREATE**.  
 3.  When prompted to restage your application, click **RESTAGE** and wait a few moments for your application to be running again.

### Create your Bluemix DevOps Services project
5.  Fork the [current repository][current_repo_url].
6.  Login to [Bluemix DevOps Services][devops_services_url] and create a new project.
7.  Enter a name for your new project.  _lets-chat-demo_ will be used here for reference.
8.  Select **Link to an existing GitHub repository** and **Link to a Git repo on GitHub**.  Select the newly forked repository.  
9.  Ensure under **Make this a Bluemix Project**, that the space selected is the space you deployed your bridge application to above.  
10.  Click **CREATE** and wait for your Bluemix DevOps Services project to be created.  Now whenever any changes are made in your forked GitHub repository, they will flow into this project and kick off the Delivery Pipeline you will configure in the next step.

### Configure the Delivery Pipeline - Basic
11.  Once created, go to the **BUILD & DEPLOY** tab of your project.  
12.  TBD Configure simple build and deploy of lets-chat/Dockerfile

### Configure the Delivery Pipeline - Advanced
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
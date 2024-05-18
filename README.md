# Docker Demo

The simplest kind.

Based on [https://www.cherryservers.com/blog/docker-build-command](https://www.cherryservers.com/blog/docker-build-command)

How to build a Docker image from Dockerfile: Step-by-step
To build a Docker image from Dockerfile, let's see the docker build command in action. In the below steps, we will build a simple Docker image, a web server to serve out a web page through installation. You're going to be building, running, and testing it on your local computer.

## Step 1 - Create a working directory

Create a directory or folder to use for this demonstration ("docker-demo" is used here) and navigate to that directory by running the following commands in your terminal:

mkdir docker-demo
cd docker-demo
Create a file called "index.html" in the directory and add the following content to it:

``` html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Simple App</title>
  </head>
  <body>
    <h1>Hello World</h1>
    <p>This is running in a docker container</p>
  </body>
</html>
```

This will serve as the web page to be served up by the server.

## Step 2 - Select a base image

Next, select a suitable base image from Docker Hub or a local repository. The base image forms the foundation of your custom image and contains the operating system and essential dependencies. Almost every single image for Docker is based on another image. For this demonstration, you'd be using nginx:stable-alpine3.17-slim as the base image.

## Step 3 - Create a Dockerfile

Now create a file named "Dockerfile". This file will define the build instructions for your image. By default, when you run the docker build command, docker searches for the Dockerfile.

## Step 4 - Add build instructions to the Dockerfile

Open the Dockerfile in a text editor and add the following lines:

``` bash
FROM nginx:stable-alpine3.17-slim
COPY index.html /usr/share/nginx/html

EXPOSE 80 
CMD ["nginx", "-g", "daemon off;"]
```

The instruction above will create a Docker image that serves the provided "index.html" file through the Nginx web server when a container is launched based on that image.

The FROM instruction initializes a new build stage and sets the base image for subsequent instructions. The COPY instruction copies files or directories (usually the source code) from the source to the specified location inside the image. It copies the file to the "/usr/share/nginx/html" directory, which is the default location for serving static files in the Nginx web server. The main purpose of the CMD instruction is to provide defaults for executing containers. The instructions defined in Dockerfiles differ based on the kind of image you're trying to build.

## Step 5 - Build the image using the Docker build command

Before building the Docker image, confirm that you have Docker installed by running the docker --version command.

confirm docker install

To build your container, make sure you're in the folder where you have your Dockerfile and run the following command in the terminal:

docker build -t sampleapp:v1 .
This command initiates the Docker build process to create a Docker image based on the instructions specified in the Dockerfile located in the current directory (.)

The -t flag specifies a tag for the image, allowing you to assign a name and version to it. In this case, the image will be tagged as "sampleapp" with the version "v1" providing a descriptive identifier for the image, making it easier to reference and manage.

You should see the build process start and an output indicating that it has finished when it is done.

docker build

## Step 6 - Verify the built Docker image

After a successful build, verify the image by running the docker images command to list all the available images on your Docker host. You should see your newly created image listed with its assigned tag and other relevant details, ready to be used for running containers or pushing to a container registry for distribution.

## Step 7 - Run the Docker image

Next, run the Docker image as a container using:

``` bash
docker run -p 8080:80 sampleapp:v1
```

This command tells Docker to run the sampleapp container. The -p flag specifies the port mapping, which maps a port from the host machine to a port inside the container. Here, you are mapping port 8080 of the host machine to port 80 of the container. You can modify the host port as per your preference. Ensure you specify the image name and version you used when building the image.

## Step 8 - Access the application

With the container running, you can go ahead to access the application. Open a web browser and navigate to <http://localhost:8080> and you should see the sample web page displayed on your web browser.

## Kubernetties Deployment

If you did not clone the repository create the following:

``` bash
mkdir base
cd base
touch docker-demo-deployment.yaml
touch docker-demo-ingress.yaml
cd ..
touch docker-demo-namespace.yaml
touch kustomization.yaml
```

local-dockerdemo.tar

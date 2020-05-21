# Strings Dowser Continuous Integration &amp; Deployment project

## Project skills
* Working in AWS
* Using Jenkins to implement Continuous Integration and Continuous Deployment
* Building pipelines
* Working with CloudFormation to deploy clusters
* Building Kubernetes clusters
* Building Docker containers in pipelines

## Project steps
### 1. Propose and Scope the Project
The project scope is building a CI/CD pipeline for `strings-dowser` Flask application based on Python 3.
### 2. Use Jenkins and implement rolling deployment
CI/CD pipeline is implemented by [Jenkins](https://www.jenkins.io) equipped with [Blue Ocean](https://www.jenkins.io/projects/blueocean/) plugin in order to simplify management and visualization. [Jenkins](https://www.jenkins.io) could be executed both in a provisioned server (e.g. installing it in [AWS EC2](https://aws.amazon.com/ec2) instance) and on a local machine (in my case Jenkins is executed as a [Docker](https://www.docker.com) container based on [official Jenkins Docker image](https://hub.docker.com/r/jenkins/jenkins))

Build output is a [Docker](https://www.docker.com) image that is deployed on a [Kubernetes](https://kubernetes.io) cluster by [performing a rolling update](https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro).
### 3. Pick AWS Kubernetes as a Service
Application is hosted by [AWS](https://aws.amazon.com) and [Kubernetes](https://kubernetes.io) cluster lives into [Amazon Elastic Kubernetes Service (Amazon EKS)](https://aws.amazon.com/eks). Cloud Infrastructure is fully defined and provisioned (IaC) through [Cloudformation](https://aws.amazon.com/eks) templates. Infrastructure and K8s cluster provisioning is prerequisite for pipeline execution. 
### 4. Build pipeline
Before every pipeline execution start, this GitHub repository is checked in order to pull most recent version of the project. CI/CD [Jenkins](https://www.jenkins.io) pipeline is composed of 7 stages:
1. __Setup__: Python virtual environment is created in order to isolate dependencies and application execution
1. __Dependencies installation__: Python requirements is installed in virtual environment
1. __Linting__: [Dockerfile](https://docs.docker.com/engine/reference/builder) is linted with [Hadolint](https://github.com/hadolint/hadolint). Python sources linting is performed with [Pylint](https://www.pylint.org).
1. __Docker build__: [Docker](https://www.docker.com) image is built and tagged with a specific version.
1. __Registry login__: Built [Docker](https://www.docker.com) image will be pushed to [Docker Hub](https://hub.docker.com) public registry. This step perform login to Docker Hub.
1. __Image upload__: Upload to Docker Hub is performed in this step. After successfully completion, image is publicly available and downladable by K8s.
1. __Application deploy__: access to K8s cluster is automatically configured. Application deployment (with rolling update mechanism) and [Load Balancer](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer) service are applied to the cluster.
### 5. Test pipeline
After successfully deployment, application is available at the public DNS name of the [AWS Load Balancer](https://aws.amazon.com/elasticloadbalancing) created by K8s service and is exposed on 80 port.

A commit on source GitHub project could trigger (only if a scan repository policy is correctly configured on Jenkins) a new full pipeline execution, from source pulling to application deployment.

While new application version is deploying to K8s cluster, Pods instances are incrementally update with new ones. This operation takes place with no downtimes.

## Project structure
- `strings-dowser` folder contains Python Flask source project and Dockerfile.
- `Makefile` defines `make` ([reference here](https://www.gnu.org/software/make)) commands used by Jenkins during pipeline execution.
- `Jenkinsfile` Jekins pipeline definition file.
- `*_docker.sh` files make Docker commands available in order to build, upload to registry and optionally launch a local container running out of the box `strings-dowser` application.
- `cloudformation` folder contains IaC Cloudformation template and scripts that allows resources creation via CLI.
- `k8s` contains Kubernetes deployment and service definition and scripts that allows resources creation via CLI.
- `utils` contains utility scripts not directly used by pipeline.
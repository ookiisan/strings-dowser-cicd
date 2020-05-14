pipeline {
  agent any
  stages {
    stage('Setup source environment') {
      steps {
        sh 'make setup'
      }
    }
    stage('Install dependencies') {
      steps {
        sh 'make install'
      }
    }
    stage('Linting Dockerfile and Python sources') {
      steps {
        sh 'make lint'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'make build'
      }
    }
    stage('Login to Docker Hub') {
      steps {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
          sh 'docker login -u ookiisan -p ${dockerhubpwd}'
        }
      }
    }
    stage('Upload Image to Docker Hub') {
      steps {
        sh 'make upload'
      }
    }
    stage('Deploy strings-dowser on Kubernetes cluster by rolling update') {
      steps {
        sh 'make deploy'
      }
    }
  }
}

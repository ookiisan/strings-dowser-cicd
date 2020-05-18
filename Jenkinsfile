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
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')])
          sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
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

pipeline {
  agent any
  stages {
    stage("build") {
      steps {
        script {
          echo "Building the application..."
        }

      }
    }
    stage("build image") {
      steps {
        script {
          echo "Building the docker image..."
          withCredentials([usernamePassword(credentialsId: 'dockerhub-repo', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
            sh 'docker build -t bytebad/my-repo:jn-2.0 .'
            sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
            sh 'docker push bytebad/my-repo:jn-2.0'
          }
        }

      }
    }
    stage("deploy") {
      steps {
        script {
          echo "Deploying the application..."
        }
      }
    }
  }
}
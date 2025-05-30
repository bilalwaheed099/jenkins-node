pipeline {
  agent any
  // parameters {
  //   choice(name: "Version", choices: ['1.1', '1.2', '1.3'], description: "")
  //   booleanParam(name: "executeTests", defaultValue: true, description: "")
  // }
  stages {
    stage('init') {
      steps {
        script {
         gv = load "script.groovy"
        }
      }
    }

    stage("build") {
      steps { 
        script {
          gv.buildApp()
        }
      }
    }

    stage("test") {
      when {
        expression {
          params.executeTests
        }
      }
      steps {
        script {
          gv.testApp()
        }
      }
    }

    stage("deploy") {
      steps {
        script {
          // env.ENV = input messsage: "Select the deployment environment", ok: "Done", parameters: [choice(name: "env", choices: ['dev', 'staging', 'prod'], description: '')]
          // gv.deployApp()
          // def dockerCmd = 'docker run -p 4000:4000 -d bytebad/my-repo:jn-3.0'
          def dockerComposeCmd = 'docker-compose -f docker-compose.yaml up --detach'
          echo "Deploying the application"
          sshagent(['ec2-server-key']) {
            sh "scp docker-compose.yaml ec2-user@35.159.15.201:/home/ec2-user"
            sh "ssh -o StrictHostKeyChecking=no ec2-user@35.159.15.201 ${dockerComposeCmd}"
          }
        }
      }
    }
  } 
}

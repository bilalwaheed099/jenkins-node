pipeline {
  agent any
  parameters {
    choice(name: "Version", choices: ['1.1', '1.2', '1.3'], description: "")
    booleanParam(name: "executeTests", defaultValue: true, description: "")
  }
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
          env.ENV = input messsage: "Select the deployment environment", ok: "Done", parameters: [choice(name: "env", choices: ['dev', 'staging', 'prod'], description: '')]
          gv.deployApp()
          echo "Test deployment another"
        }
      }
    }
  } 
}

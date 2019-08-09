pipeline {
  agent any
  tools {nodejs "node"}
  
  stages {
    stage('preflight') {
      steps {
          nodejs(nodeJSInstallationName: 'Node 10.16', configId: '<config-file-provider-id>') { sh 'npm install' }
        echo sh(returnStdout: true, script: 'env')
        sh 'node -v'
      }
    }
    stage('build') {
      steps {
        sh 'npm --version'
        sh 'git log --reverse -1'
        sh 'npm install'
      }
    }
    stage('test') {
      steps {
        sh 'npm test'
      }
    }
  }
}
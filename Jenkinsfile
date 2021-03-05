pipeline {
    agent { docker { image 'node:14-alpine' } }
    stages {
        stage('install') {
            steps {
                sh 'npm install'
            }
        }
    }
}
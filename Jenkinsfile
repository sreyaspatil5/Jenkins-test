pipeline {
    agent any

    tools {
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/master']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/sreyaspatil5/Jenkins-test.git']]
                )
                bat "mvn clean install"
            }
        }

        stage('Build docker image') {
            steps {
                script {
                    bat "docker build -t spquantum/devops_integration ."
                }
            }
        }
        
        stage('Push image to Hub'){
            steps {
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                        bat "docker login -u spquantum -p ${dockerpwd}"
                    }
                    bat "docker push spquantum/devops_integration"
                }
            }
        }
    }
}

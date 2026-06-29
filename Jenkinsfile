pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ZORROamith/devops-web-deployment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-web .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker stop devops-web || true'
                sh 'docker rm devops-web || true'
                sh 'docker run -d -p 80:80 --name devops-web devops-web'
            }
        }
    }
}

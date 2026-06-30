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
        stage('Deploy with Ansible') {
            steps {
                sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/inventory ansible/deploy.yml --private-key /var/lib/jenkins/devops-key.pem'
            }
        }
    }
}

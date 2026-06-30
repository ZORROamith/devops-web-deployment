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
                // Building the image locally on Jenkins server
                sh 'docker build -t devops-web .'
            }
        }
        stage('Deploy with Ansible') {
            steps {
                // We add ANSIBLE_HOST_KEY_CHECKING=False to bypass the prompt
                sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/inventory ansible/deploy.yml --private-key /home/ubuntu/devops-key.pem'
            }
        }
    }
}

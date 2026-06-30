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
                // Run the playbook. 
                // Ensure the path to your key is the exact path on your Jenkins EC2 server
                sh 'ansible-playbook -i ansible/inventory ansible/deploy.yml --private-key /home/ubuntu/devops-key.pem'
            }
        }
    }
}

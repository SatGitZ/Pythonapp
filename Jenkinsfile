pipeline {
    agent any
    environment {
        IMAGE_NAME= "test-app"
    }
    stages {
        stage('Git clone') {
            steps {
                git 'https://github.com/SatGitZ/Pythonapp.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'sudo -S docker build  -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                sh ' chmod +x test_api.sh && ./test_api.sh'
            }
        }

        stage('load to minikube') {
            steps {
                sh ''' 
                ' eval $(minikube docker-env)'
                   'docker build -t $IMAGE_NAME .'
                   ''' 
            }
        }
        stage ('Deploy to minikube'){
            steps {
                sh 'kubectl apply -f Deployment.yaml'
                 sh  'kubectl apply -f service.yaml'
        }
    }
}
}
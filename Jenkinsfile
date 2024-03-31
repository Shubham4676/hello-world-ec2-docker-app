pipeline {
    agent any

    stages {
        stage('git cloning') {
            steps {
                echo 'cloning git repo!'
                git url: 'https://github.com/InCloudWithDeepak/hello-world-ec2-docker-app.git', branch: 'main'
            }
        }
        stage('building docker image') {
            steps {
                echo 'building docker image'
                sh 'docker build -t myapp .'
            }
        }
        stage('push latest image to dockerhub') {
            steps {
                echo 'push latest image to dockerhub'
                withCredentials([usernamePassword(credentialsId:"dockercreds",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser")]){
                sh "docker tag myapp ${env.dockerhubuser}/myapp:latest"
                sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                sh "docker push ${env.dockerhubuser}/myapp:latest"
                }
            }
        }
        stage('deploying the container') {
            steps {
                echo 'deploying the container'
                sh 'docker-compose down && docker-compose up -d'
            }
        }
    }
}

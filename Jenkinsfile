pipeline {
    agent any
    environment {
        IMAGE_NAME = 'rohit965/webapp'
        DOCKERHUB_CRED = credentials('docker-hub')
        DOCKER_IMAGE = ''

    }
    stages {
        /* stage('Cloning Git') {
            steps {
                git 'https://github.com/gustavoapolinario/microservices-node-example-todo-frontend.git'
            }
        } */
        stage("'Build' Compile & Package") {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    DOCKER_IMAGE = docker.build("$IMAGE_NAME:$BUILD_NUMBER")
                    echo "$BUILD_NUMBER" 
                    echo "$BUILD_ID"
                    echo "$BUILD_TAG"
                }
            }

        }
        stage('Publish image into Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CRED) {
                        DOCKER_IMAGE.push("$BUILD_NUMBER")
                    }
                }
                
            }
        } 
        
    }
}
pipeline {
    agent any
    environment {
        IMAGE_NAME = 'rohit965/webapp'
        DOCKERHUB_CRED = 'docker-hub'
        DOCKER_IMAGE = ''

    }
    stages {
        /* stage('Cloning Git') {
            steps {
                git 'https://github.com/rohit965/WebApp.git'
            }
        } */
        //Build and publish docker images using jenkins scripted pipeline 
        //https://medium.com/faun/docker-build-push-with-declarative-pipeline-in-jenkins-2f12c2e43807
        //https://www.edureka.co/community/55640/jenkins-docker-docker-image-jenkins-pipeline-docker-registry

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
                    docker.withRegistry('', DOCKERHUB_CRED) {
                        DOCKER_IMAGE.push("$BUILD_NUMBER")
                    }
                }
                
            }
        } 
        stage('Deploying container onto Docker hosts') {
            steps {
                sh 'ssh -i /var/lib/jenkins/.ssh/rsa_id jenkins@34.66.161.175'
            }
        }
        /* stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $IMAGE_NAME:$BUILD_NUMBER"
            }
        } */
        
    }
}

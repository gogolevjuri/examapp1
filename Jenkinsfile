pipeline {
    agent any
    environment {
      DOCKER_TAG = getVersion()
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Docker Build'){
            steps{
                echo "Create docker image gogolevjuri/firstapp:${DOCKER_TAG} "
                sh "docker build . -t gogolevjuri/firstapp:${DOCKER_TAG} "
            }
        }
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    echo 'Logging into docker hub'
                    sh "docker login -u gogolevjuri -p ${dockerHubPwd}"
                }
                echo 'Deploying....2'
                //sh "docker tag gogolevjuri/firstapp:latest gogolevjuri/firstapp:${DOCKER_TAG}"
                //sh "docker push gogolevjuri/firstapp:${DOCKER_TAG} "
                //sh "docker push gogolevjuri/firstapp:latest "
            }
        }
    }
}
def getVersion(){
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}

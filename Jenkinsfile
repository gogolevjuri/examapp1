pipeline {
    agent any

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
        stage('Docker test') {
            steps {
                sh "docker image build -t my_docker ."
                // This step should not normally be used in your script. Consult the inline help for details.
                withDockerContainer('python:3.9-alpine') {
                    echo 'fine....'
                }
            }
        }
    }
}

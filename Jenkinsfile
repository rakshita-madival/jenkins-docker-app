pipeline {
    // Run on the main node by default
    agent any 

    environment {
        IMAGE_NAME = "my-devops-app:${env.BUILD_NUMBER}"
    }

    stages {
        // Stage 1: Prepare Workspace
        stage('Prepare Workspace') {
            steps {
                echo 'Stashing files for later...'
                stash includes: 'app.js, Dockerfile', name: 'source'
            }
        }

        // Stage 2: Build
        stage('Build') {
            steps {
                echo 'This is the build stage.'
                echo 'For a real app, we might run "npm install" here.'
            }
        }

        // Stage 3: Test
        stage('Test') {
            steps {
                echo 'This is the test stage.'
                echo 'For a real app, we would run "npm test" here.'
                sh 'echo "Simulating tests... tests pass!"'
            }
        }

        // Stage 4: Deploy (running directly on Jenkins container)
        stage('Deploy') {
            agent any
            steps {
                echo "Deploying directly on the main Jenkins container..."
                unstash 'source'
                echo "Building Docker image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} ."
                echo "Stopping old container if exists..."
                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'
                echo "Running new container..."
                sh "docker run -d --name my-app -p 3001:3000 ${IMAGE_NAME}"
            }
        }
    }

    post {
        always {
            echo 'Pipeline has finished.'
        }
        success {
            echo 'Congratulations, the app is deployed!'
            echo 'Check http://localhost:3001'
        }
        failure {
            echo 'Something went wrong. Check the logs.'
        }
    }
}

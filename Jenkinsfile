pipeline {
    // Run this pipeline on any available Jenkins 'agent' (worker)
    agent any

    environment {
        // Define a unique name for our docker image
        // ${env.BUILD_NUMBER} is a Jenkins variable (like 1, 2, 3...)
        IMAGE_NAME = "my-devops-app:${env.BUILD_NUMBER}"
    }

    stages {
        // Stage 1: Get the code from GitHub
        stage('Checkout') {
            steps {
                // This command is built-in to Jenkins
                git url: 'https://github.com/rakshita-madival/jenkins-docker-app.git', branch: 'main'
            }
        }

        // Stage 2: Build (not much to do for this simple app)
        stage('Build') {
            steps {
                echo 'This is the build stage.'
                echo 'For a real app, we might run "npm install" here.'
            }
        }

        // Stage 3: Test (just a placeholder)
        stage('Test') {
            steps {
                echo 'This is the test stage.'
                echo 'For a real app, we would run "npm test" here.'
                sh 'echo "Simulating tests... tests pass!"'
            }
        }

        // Stage 4: Deploy by building and running the Docker image
        stage('Deploy') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"

                // This command runs in the terminal (sh = shell)
                // It uses the 'Dockerfile' in your repo
                sh "docker build -t ${IMAGE_NAME} ."

                echo "Image built. Now running the new container..."

                // Stop and remove any old container first, if it exists
                // '|| true' means "don't fail the pipeline if this command fails"
                // (which it will the first time, since 'my-app' doesn't exist yet)
                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'

                // Run the new Docker image as a container
                // -d = run in detached (background) mode
                // --name my-app = give it a simple name
                // -p 3001:3000 = connect your computer's port 3001 to the container's port 3000
                sh "docker run -d --name my-app -p 3001:3000 ${IMAGE_NAME}"
            }
        }
    }

    // This 'post' block runs after all stages
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

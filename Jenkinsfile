pipeline {
    // Run on the main node by default
    agent any 

    environment {
        IMAGE_NAME = "my-devops-app:${env.BUILD_NUMBER}"
    }

    stages {
        // This stage runs on the main agent and saves the files
        stage('Prepare Workspace') {
            steps {
                echo 'Stashing files for later...'
                // The code is already checked out by Jenkins automatically
                // We just need to stash (save) the files we need for the deploy stage
                stash includes: 'app.js, Dockerfile', name: 'source'
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

        // Stage 4: Deploy
        stage('Deploy') {
            // Use a special, temporary agent just for this stage
            agent {
                docker {
                    image 'docker:latest'
                    // Mount the host's docker socket so this container can run docker commands
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                echo "Deploy agent is running. Getting files..."
                // UNSTASH (load) the files from the 'Prepare' stage
                unstash 'source'

                echo "Files are here. Building Docker image: ${IMAGE_NAME}"

                // Now this command will work, because this agent has 'docker' installed
                sh "docker build -t ${IMAGE_NAME} ."

                echo "Image built. Now running the new container..."

                sh 'docker stop my-app || true'
                sh 'docker rm my-app || true'
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

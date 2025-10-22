# jenkins-docker-app
Simple Jenkins CI/CD pipeline using Docker

Objective

The goal of this task was to set up a basic Jenkins pipeline to automate building, testing, and deploying an application using Docker. This demonstrates how CI/CD works in a DevOps environment.

🛠 Tools & Technologies Used

Jenkins – for pipeline automation ⚙️

Docker – for containerizing the application 🐳

GitHub – to store the project repository 📂

Node.js – simple application runtime 🟢

📁 Project Structure
jenkins-docker-app/
├── app.js          # Simple Node.js application
├── Dockerfile      # Docker instructions for app container
└── Jenkinsfile     # Declarative Jenkins pipeline

📌 Pipeline Overview

The Jenkins pipeline is a Declarative Pipeline with the following stages:

Checkout SCM – Fetches the latest code from GitHub 🔄

Prepare Workspace – Stashes project files for later 📦

Build Stage – Simulates building the app 🛠

Test Stage – Simulates running tests ✅

Deploy Stage – Builds the Docker image and runs the container 🚀

⚙️ Steps We Followed

Installed Jenkins using Docker and started the Jenkins container 🐳

Created a Jenkins pipeline defining all CI/CD stages 📝

Configured Jenkins to fetch the project from GitHub 🔗

Set up Docker permissions inside Jenkins container 🛡

Ran the pipeline and verified each stage:

Build → ✅

Test → ✅

Deploy → ✅

Accessed the deployed application at:

http://localhost:3001


Output: "Hello from Jenkins!" 💬

📈 Outcome

Successfully automated build, test, and deploy process 🎯

Learned how to configure Jenkins pipelines with Docker 🐳

Gained hands-on experience in DevOps CI/CD workflow ⚡

✨ Key Takeaways

Jenkins pipelines allow automation of repetitive tasks ⚙️

Docker ensures consistent deployment environments 🐳

CI/CD improves efficiency and reduces human error ✅

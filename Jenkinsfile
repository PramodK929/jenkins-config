pipeline {
    agent any  // Runs on the Jenkins node/container

    environment {
        // JAVA_HOME is already set in jenkins/jenkins:lts-jdk17 image
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull latest code from Git repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Make Gradle wrapper executable
                sh 'chmod +x gradlew'
                // Clean and build the project
                sh './gradlew clean build --no-daemon'
            }
        }

        stage('Test') {
            steps {
                // Run tests with Gradle
                sh './gradlew test --no-daemon'
            }
        }

        stage('Archive Artifact') {
            steps {
                // Archive generated JAR files
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }
    }

    post {
        always {
            // Clean workspace after build
            cleanWs()
        }

        success {
            echo 'Build completed successfully!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}

pipeline {
    agent any

    tools {
        jdk 'JDK-17'  // Must match the JDK name in Jenkins tools
    }

    environment {
        JAVA_HOME = tool(name: 'JDK-17', type: 'hudson.model.JDK')
        PATH = "${env.JAVA_HOME}/bin:${env.PATH}"
        ORG_GRADLE_JAVA_HOME = "${env.JAVA_HOME}"  // <-- Add this line
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean build'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
            }
        }
    }
}

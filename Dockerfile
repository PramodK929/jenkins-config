# Use Jenkins LTS with JDK 17
FROM jenkins/jenkins:lts-jdk17

# Switch to root to install any extra packages if needed
USER root

# Example: install git if missing
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins

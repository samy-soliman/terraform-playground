# Use the official Jenkins image as the base image
FROM jenkins/jenkins:latest

# Switch to the root user for administrative tasks
USER root

# Install necessary packages for Terraform installation
RUN apt update && apt install -y wget unzip curl 

# Download and install Terraform version 1.5.7 directly
RUN wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip -O terraform.zip \
    && unzip terraform.zip -d /usr/local/bin \
    && rm terraform.zip

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip

# Switch back to the Jenkins user
USER jenkins

# Expose the Jenkins web port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

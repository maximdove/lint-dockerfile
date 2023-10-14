pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Assumes that the repository URL and credentials are configured in Jenkins
                checkout scm
            }
        }

        stage('Check Commit Message') {
            steps {
                script {
                    def commitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()
                    // Assuming a simple check for the presence of a JIRA ticket code at the start of the commit message
                    if (!commitMessage.matches('^[A-Z]+-[0-9]+.*')) {
                        error("Commit message does not adhere to best practices")
                    }
                }
            }
        }

        stage('Lint Dockerfiles') {
            steps {
                script {
                    def lintResult = sh(script: 'docker run --rm -v $(pwd):/app -w /app hadolint/hadolint hadolint Dockerfile', returnStdout: true).trim()
                    if (lintResult) {
                        echo lintResult
                        error("Linting errors found")
                    }
                }
            }
        }
    }

    post {
        failure {
            // This block allows you to perform actions on build failure, such as sending notifications
            echo 'Build failed!'
        }
    }
}

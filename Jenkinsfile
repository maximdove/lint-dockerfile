pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Check Commit Message') {
            steps {
                script {
                    def commitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()
                    def isValid = commitMessage.length() > 10 && commitMessage =~ /JIRA-\d+/
                    if (!isValid) {
                        error("Commit message does not adhere to best practices")
                    }
                }
            }
        }
        stage('Lint Dockerfiles') {
            steps {
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }
    }
    post {
        failure {
            script {
                currentBuild.result = 'UNSTABLE'
            }
        }
    }
}

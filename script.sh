pipeline {
    agent any

    environment {
        CREDENTIALS = credentials('demo_user_password')
    }

    stages {
        stage('demo') {
            steps {
                echo "${CREDENTIALS_USR}"
                echo "${CREDENTIALS_PSW}"
            }
        }
    }
}
 

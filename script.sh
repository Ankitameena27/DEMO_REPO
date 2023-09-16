pipeline {
    agent any

    environment {
        CREDENTIALS = credentials('demo_user_password')
    }

    stages {
        stage('demo') {
            steps {
                script {
                sh './print_user_name.sh'
            }
        }
    }
}
 

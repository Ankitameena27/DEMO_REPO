pipeline {
    agent any

    environment {
        CREDENTIALS = credentials('demo_user_password')
    }

    stages {
        stage('demo') {
            steps {
                script {
                    // Add the shebang line for the shell script
                    sh '#!/bin/bash\n./print_user_name.sh'
                }
            }
        }
    }
}

 

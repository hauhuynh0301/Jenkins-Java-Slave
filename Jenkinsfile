pipeline {
    agent { label 'java-agent' } // Specify your agent label
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/BuntyRaghani/spring-boot-hello-world.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package' // Adjust if you use a different build tool
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        stage('Deploy') {
            steps {
                sh 'java -jar target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar --server.port=7788'
                //sh 'mvn spring-boot:run'
            }
        }
    }
}
pipeline{
    agent any
    stages{
        stage('Build Docker Image'){
            steps{
                sh 'docker compose build -d'
            }
        }
        stage('Up Container from compose'){
            steps{
                sh 'docker compose up -d'
            }
        }
        stage('Run Additional Artisan Command'){
            steps{
                sh '''
                docker exec app php artisan migrate
                docker exec app php aritsan db:seed
                docker exec app php artisan key:generate
                '''
            }
        }
    }
}

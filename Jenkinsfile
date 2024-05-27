pipeline{
    agent any
    stages{
        stage('Build Image'){
            steps{
                sh 'docker compose build'
            }
        }
        stage('Compose up image'){
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

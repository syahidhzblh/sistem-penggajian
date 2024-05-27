pipeline{
    agent any
    stages{
        stage('Stop All Running Container'){
            steps{
                sh 'docker rm -f $(docker ps -a -q)'
            }
        }
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
                docker compose exec app php artisan migrate
                docker compose exec app php aritsan db:seed
                docker compose exec app php artisan key:generate
                '''
            }
        }
        stage('SSL Configuration'){
            steps{
                sh '''
                docker compose exec webserver certbot -n register --agree-tos --email support@hisbul.my.id
                docker compose exec webserver certbot -n --nginx -d penggajian.hisbul.my.id
                '''
            }
        }

    }
}

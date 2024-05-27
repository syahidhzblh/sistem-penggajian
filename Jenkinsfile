pipeline{
    agent any
    stages{
        stage('Stop All Running Container'){
            steps{
                script{
                    try{
                        sh 'docker rm -f $(docker ps -a -q)'
                    }catch (Exception e){
                        echo 'No running Container'
                    }
                }
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
                docker exec app php artisan migrate
                docker exec app php artisan db:seed
                docker exec app php artisan key:generate
                '''
            }
        }
        stage('SSL Configuration'){
            steps{
                sh '''
                docker exec webserver certbot -n register --agree-tos --email support@hisbul.my.id
                docker exec webserver certbot -n --nginx -d penggajian.hisbul.my.id
                '''
            }
        }

    }
}

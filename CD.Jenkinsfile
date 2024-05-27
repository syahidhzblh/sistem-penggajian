pipeline{
    agent any
    environment{
        GIT_CREDENTIALS_ID = 'git-token'
    }
    stages{
        stage('Stop Main Container App'){
            steps{
                script{
                    try{
                        sh 'docker rm -f app'
                    }catch (Exception e){
                        echo 'Main Container App already Stop'
                    }
                }
            }
        }
        stage('Remove Junk Images with tag none'){
            steps{
                sh 'docker image prune -f --filter="dangling=true"'
            }
        }
        stage('Rebuild App Image'){
            steps{
                sh 'docker build -t laravel-app:latest .'
            }
        }
        stage('Run Container App Laravel'){
            steps{
                sh 'docker run -it -d --name=app --network=laravel-net -e SERVICE_NAME=app laravel-app:latest'
            }
        }
    }
}

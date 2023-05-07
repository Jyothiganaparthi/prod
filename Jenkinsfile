pipeline{
    agent any
    stages{
    stage('gitcheckout'){
        steps{
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Jyothiganaparthi/prod.git'
        }
    }
    stage('maven test'){
        steps{
        sh 'mvn test'
        }
    }
    stage('maven integrate'){
        steps{
        sh 'mvn verify -DskipunitTest'
        }
    }
    stage('maven install'){
        steps{
        sh 'mvn clean install'
        }
    }
    stage('qualityanalysis'){
        steps{
            script{
        withSonarQubeEnv(credentialsId: 'sonarid') {
         sh 'mvn clean package sonar:sonar'
}
            }
        }
    }
    stage('nexus'){
        steps{
            script{
        
        nexusArtifactUploader artifacts: 
            [
                [
                    artifactId: 'helloworld',
              classifier: '',
              file: 'target/helloworld.jar', 
              type: 'jar'
                ]
            ], 
            credentialsId: 'nexusid',
            groupId: 'org.springframework', 
            nexusUrl: '18.183.158.253:8081', 
            nexusVersion: 'nexus3',
            protocol: 'http', 
            repository: 'project-1', 
            version: '1.0.1'
    }
        }
    }
        stage('image build'){
            steps{
                script{
                sh 'docker build -t image1 .'
                }
            }
        }
   
}
}

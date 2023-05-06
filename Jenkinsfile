node{
    stage('gitcheckout'){
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Jyothiganaparthi/prod.git'
    }
    stage('maven test'){
        sh 'mvn test'
    }
    stage('maven integrate'){
        sh 'mvn verify -DskipunitTest'
    }
    stage('maven install'){
        sh 'mvn clean install'
    }
    stage('qualityanalysis'){
        withSonarQubeEnv(credentialsId: 'sonarid') {
         sh 'mvn clean package sonar:sonar'
}
        
    }
    stage('qualitygate'){
       waitForQualityGate abortPipeline: false, credentialsId: 'sonarid' 
    }
   
}

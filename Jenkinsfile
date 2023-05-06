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
   
}

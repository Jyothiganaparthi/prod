node{
    stage('gitcheckout'){
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Jyothiganaparthi/prod.git'
    }
    stage('maven build'){
        sh 'mvn clean install'
    }
}

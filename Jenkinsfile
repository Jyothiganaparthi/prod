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
    stage('nexus'){
        def readPomVersion = readMavenPom file: 'pom.xml'
        nexusArtifactUploader artifacts: 
            [
                [
                    artifactId: 'jb-hello-world-maven',
              classifier: '',
              file: 'target/jb-hello-world-maven-0.2.0.jar', 
              type: 'jar'
                ]
            ], 
            credentialsId: 'nexusid',
            groupId: 'org.springframework', 
            nexusUrl: '54.65.233.83:8081', 
            nexusVersion: 'nexus3',
            protocol: 'http', 
            repository: 'project-1', 
            version: '${readPomVersion}'
    }
   
}

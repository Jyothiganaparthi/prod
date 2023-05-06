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
        def readPomVersion = readMavenPom file: 'pom.xml'
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
            nexusUrl: '54.65.233.83:8081', 
            nexusVersion: 'nexus3',
            protocol: 'http', 
            repository: 'project-1', 
            version: '$(readPomVersion.version)'
    }
        }
    }
   
}
}

node{
    stage('gitcheckout'){
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Jyothiganaparthi/prod.git'
    }
    stage('maven build'){
        sh 'mvn clean install'
    }
    stage('nexus'){
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
            nexusUrl: '43.206.110.148:8081/', 
            nexusVersion: 'nexus3',
            protocol: 'http', 
            repository: 'project-1', 
            version: '0.2.0'
    }
}


node {
    def app

    stage('Clone Repository'){
        checkout scm
    
    }

    stage('Build Image'){
        app = docker.build('doxxitxxyoung/glit-server-flask')
    }

    stage('Test Image'){
        sh echo "test succeeded"
    }

    stage('Push image'){
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        
        }
    }

}

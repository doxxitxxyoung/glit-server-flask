node {
    
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub'){
        def customImage = docker.build("doxxitxxyoung/glit-server-flask")

        /* Push the container to custom registry */
        customImage.push()

    }
}

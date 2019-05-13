node {
    //def app

    Git_Branch = "${Git_Branch_Name}"
    appName = "hycube/hellonode"
    IMAGETAG = "${Image_Tag}"
    NAME_SPACE = "${NAMESPACE}"
    ImageName = "${appName}:${NAME_SPACE}-${IMAGETAG}"
    env.BUILDIMG = "${ImageName}"
    
    stage('Clone repository') {
        checkout scm
        sh "git checkout ${Git_Branch}"
    }

    stage('Build image') {
        app = docker.build("${env.BUILDIMG}")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * incremental build number from Jenkins.
         * Pushing with tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${NAME_SPACE}-${IMAGETAG}")
        }
    }
    
    stage('Deploy Build') {
       def deployApp = 'kubectl --namespace ${NAME_SPACE} set image deployment.v1.apps/nginx-deployment nginx-test=${env.BUILDIMG}'	
       sshagent(['master-ssh-login']) {
         sh 'ssh -tt -o StrictHostKeyChecking=no billions@192.168.7.9 ${deployApp}'
       }
    }
}

node {
    //def app

    Git_Branch = "${Git_Branch_Name}"
    appName = "hycube/hellonode"
    IMAGETAG = "${Image_Tag}"
    ImageName = "${appName}:${Git_Branch}-${IMAGETAG}"
    env.BUILDIMG = "${ImageName}"
    
//    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

//        checkout scm
//        sh "git checkout ${Git_Branch}"
//    }

//    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

//        app = docker.build("${env.BUILDIMG}")
//    }

//    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
//        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
//            app.push("${Git_Branch}-${IMAGETAG}")
            // app.push("latest")
//        }
//    }
    
//    stage ('Deploy Build') {
//        sh "sed 's#__BUILD_TAG__#'${IMAGETAG}'#' ./k8s/deployment.yaml | kubectl apply -n $namespace -f -"
//    }
    
//    stage('Deploy Build') {
//       def deployApp = 'kubectl --namespace ${Git_Branch_Name} set image deployment.v1.apps/nginx-deployment nginx-test=${env.BUILDIMG}'	
//       sshagent(['master-ssh-credentials']) {
//         sh 'ssh -tt -o StrictHostKeyChecking=no billions@192.168.7.9 ${deployApp}'
//       }
//    }
    
        stage('Deploy Build') {
withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'docker-hub-credentials', namespace: '', serverUrl: 'https://192.168.7.9:6443') {
    sh "kubectl get pods"
}
        }
}

node {
    //def app

    Git_Branch = "${Git_Branch_Name}"
    appName = "47billion/hellonode"
    IMAGETAG = "${Image_Tag}"
    ImageName = "${appName}:${Git_Branch}-${IMAGETAG}"
    env.BUILDIMG = "${ImageName}"
    
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
        sh "git checkout ${Git_Branch}"
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("${env.BUILDIMG}")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${IMAGETAG}")
            // app.push("latest")
        }
    }
    
//    stage ('Deploy Build') {
//        sh "sed 's#__BUILD_TAG__#'${IMAGETAG}'#' ./k8s/deployment.yaml | kubectl apply -n $namespace -f -"
//    }
}

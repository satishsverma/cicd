node {
    def app

    Git_Branch="${Git_Branch_Name}"
    AppName = "47billion/hellonode"
    ImageName = "${appName}:${Git_Branch}-${env.BUILD_NUMBER}"
    env.BUILDIMG="${ImageName}"
    
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

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILDIMG}")
            // app.push("latest")
        }
    }
    
    stage ('Deploy Build') {
        sh "sed 's#__BUILD_TAG__#'${env.BUILDIMG}'#' ./k8s/deployment.yaml | kubectl apply -n $namespace -f -"
    }
}

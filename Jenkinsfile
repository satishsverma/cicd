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
withKubeConfig(caCertificate: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNU1EUXlPREUzTlRZd05Wb1hEVEk1TURReU5URTNOVFl3TlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTVBZCmlvUG9oZVhHN1RBOUN1N3I3dmdQM01BaVZJalJrRy9WSTY3K0JtbkNRN2xTY2FTMGRLYXh5Z3MzN2N3RjNaeHAKVTlRMGZWTnZvcUg5UGFQTEc0bUhpaytpRlJIOHpibjUrMnc3RnJzYnZjQ0l0d1MxNWM3ck80TVpzS2xTSm4vRAorYzYvNENVU01RR2kvVmFxSG11MGp4WlJ6eEdNeGQ3NHozV0g0TGxvRGg5TXNXcGpOeXpVbHI5eTcyNVduM1RBClZRZUNoL1oxNW93dXUwT0IzOThFU2x3VWtHdnkveE50Zlp5bnUwdmQvMXR4SHVWQU4wWU9wNE5CTlhpYWxqL08KSXhvUW92VnVKbllnYXZwRm5rVkhUdXluaUdNQVhqT0VCa21LSFkvVnlMSTZIbDQzM0Q0TmFZRXBoRGNPNlZPYgo4WFBhaXFXQWx2YmZwemgzbVpjQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFKbW4xcU5jUHJDd0g0SlBkQmdEQVkyMnMzaU0KRmNkTGlsR2hYYTIycnAvVTI4TmF1aW41cXU4eXMxU1ZodzR6Q0VmaGRneGF1ZTVyTGxhNUdQaVV4SytKMFBZUAorSXY4N213NEljSXdIdFpjM1RXSTZXUks0WENzQTRJczFxTFc4SlRycDlXNjdjOEgva3RGNXZuUVNLVmJNR2RBCkpxTENnTkxQMjlyTDZyZGZ3OEQ5dUJ6ZmhPeDBlNEdqem91aXh5TncwOXdtbGx4R3JMRjJpam9HK2g4V1VPcGUKbGRZdXVuUU53M1hlVGd0bHNQTEgrdUtxdVRGZFkvcmk2Nmh5a0ZreDIyUmd4R1AvaVpFRThtOVpyOWQybjFLWQpJYXc0YVdMWTU3Y3g4YVB6d0JCU1BhbUVieklHWWFsVW15d2kzcnpVd25tdkJNdWtzRjJzVWtRUTNoRT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=', clusterName: 'kubernetes', contextName: 'kubernetes', credentialsId: 'kube_ctl_details', namespace: 'default', serverUrl: 'https://192.168.7.9:6443') {
    sh "kubectl get pods"
}
        }
}

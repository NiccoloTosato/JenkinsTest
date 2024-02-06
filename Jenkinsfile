pipeline {
    agent none 
    stages {
        stage ('Donwload repo') {
              agent {
                          label 'docker'   
              }
              steps {
              sh 'ls'
              sh 'pwd'
              }
         }

        stage ('In container step') {
              agent {
                     dockerfile {
                                filename 'Dockerfile'
                                label 'docker'
                     }
              }
              steps {
                    echo 'Inside the container finally'
                    sh 'pwd'
              }
        }
   }
}


/*
dockerfile {
            filename 'Dockerfile'
            dir '/u/builder/builder/building_container/orfeobuild/images/fedora37'
            label 'builder && epyc'
	    args '-e JAVA_OPTS="-Dorg.jenkinsci.plugins.durabletask.BourneShellScript.LAUNCH_DIAGNOSTICS=true"'
        }
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
*/

pipeline {
    agent none 
    stages {
        stage ('Donwload repo') {
              agent {
                          label 'builder && epyc'   
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
                                label 'builder && epyc'
                                args '-t latest'
                     }
              }
              steps {
                    echo 'Inside the container finally ! '
                    sh 'ls'
              }
        }
   }
}


/*
dockerfile {
            filename 'Dockerfile'
            dir '/u/builder/builder/building_container/orfeobuild/images/fedora37'
            label 'builder && epyc'
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

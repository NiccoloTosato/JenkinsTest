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

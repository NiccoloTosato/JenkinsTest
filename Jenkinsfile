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
                    sh 'hostname'
              }
         }

        stage ('In container step') {
              agent {
                     label 'builder && epyc'
                     dockerfile {
                                filename 'Dockerfile'
                     }
              }
              steps {
                    echo 'Inside the container finally'
              }
        }
   }
}

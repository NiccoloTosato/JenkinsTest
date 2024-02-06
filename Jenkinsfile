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
 
                     dockerfile {
                                filename 'Dockerfile'
                                label 'builder && epyc'
                     }
              }
              steps {
                    echo 'Inside the container finally'
                    sh 'ps'
              }
        }
   }
}

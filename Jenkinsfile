pipeline {
    agent none
    options {
        timeout(time: 1, unit: 'HOURS') 
    }
    parameters {
        string(name: 'PROGRAMS_PATH', defaultValue: '/opt/programs', description: 'Path to the artifact')
        string(name: 'PROGRAMS_NAME', defaultValue: 'null', description: 'Module name') 
        booleanParam(name: 'GPU_SUPPORT', defaultValue: true, description: 'Enable or disable gpu support')
        choice(name: 'OS', choices: ['fedora37', 'fedora38', 'fedora39','almalinux9'], description: 'Select distribution')
        choice(name: 'ARCH', choices: ['zen2', 'skylake'], description: 'Select architecture')
    }
    stages {
        stage ('Donwload repo') {
              agent {
                    label 'builder && epyc'
              }
              steps {

                echo "Hello ${params.PROGRAMS_NAME}"
                    sh 'pwd'
                    sh 'hostname'
              }
         }

        stage ('In container step') {
              agent {
 
                     dockerfile {
                                filename 'Dockerfile'
                                label 'builder && epyc'
                                args '--userns="keep-id"'
                     }
              }
              steps {
                    echo 'Inside the container finally'
                    sh 'pwd'
                    sh 'ls'
              }
       }
   }
}

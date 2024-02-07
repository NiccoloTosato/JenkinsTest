pipeline {
    agent none
    options {
        timeout(time: 1, unit: 'HOURS') 
    }
    parameters {
        string(name: 'PROGRAM_PATH', defaultValue: '/opt/programs', description: 'Module path')
        string(name: 'PROGRAM_NAME', defaultValue: 'null', description: 'Module name')
        string(name: 'PROGRAM_VERSION', defaultValue: 'null', description: 'Module version') 
        booleanParam(name: 'GPU_SUPPORT', defaultValue: true, description: 'Enable or disable gpu support')
        choice(name: 'OS', choices: ['fedora37', 'fedora38', 'fedora39','almalinux9'], description: 'Select distribution')
        choice(name: 'ARCH', choices: ['zen2', 'skylake'], description: 'Select architecture')
    }
    stages {
        stage ('Init ad Download') {
              agent {
                    label 'builder && epyc'
              }
              steps {
                cleanWs()
                echo "Build ${params.PROGRAMS_NAME} version ${params.PROGRAM_VERSION}"
                echo "OS: ${params.OS}, ARCH: ${params.ARCH}"
                sh 'ls'
                sh "git clone --recursive  https://github.com/xianyi/OpenBLAS.git"
                sh "git checkout v${params.PROGRAM_VERSION}"
              }
         }

        stage ('Building step') {
              agent {
                      dockerfile {
                                filename 'Dockerfile'
                                label 'builder && epyc'
                                args '--userns="keep-id"'
                     }
              }
              steps {
                    sh 'cd OpenBLAS'
                    sh 'ls /opt/programs/'
              }
       }
   }
}

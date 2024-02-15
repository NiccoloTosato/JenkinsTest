pipeline {
    agent none
    options {
        timeout(time: 1, unit: 'HOURS') 
    }

    parameters {
        string(name: 'PROGRAM_PATH', defaultValue: '/opt/programs', description: 'Module path')
        string(name: 'PROGRAM_NAME', defaultValue: 'openBLAS', description: 'Module name')
        string(name: 'PROGRAM_VERSION', defaultValue: '0.3.26', description: 'Module version') 
        booleanParam(name: 'GPU_SUPPORT', defaultValue: true, description: 'Enable or disable gpu support')
        choice(name: 'OS', choices: ['fedora37', 'fedora38', 'fedora39','almalinux9'], description: 'Select distribution')
        choice(name: 'ARCH', choices: ['amd', 'intel'], description: 'Select architecture')
    }

    stages {
        stage ('Source retrival') {
              agent {
                    label 'builder && epyc'
              }
              steps {
                
                echo "Build ${params.PROGRAMS_NAME} version ${params.PROGRAM_VERSION}"
                echo "OS: ${params.OS}, ARCH: ${params.ARCH}"
                sh 'id || whoami'
                dir("build") {
                            cleanWs()
                            sh "git clone --recursive  https://github.com/xianyi/OpenBLAS.git"
                            sh "cd OpenBLAS && git checkout v${params.PROGRAM_VERSION}"
               }
              }
         }

        stage ('Building step') {
              environment {
                          PREFIX = "$params.PROGRAM_PATH/$params.PROGRAM_NAME/$params.PROGRAM_VERSION"
              }
              agent {
                      dockerfile {
                                filename "Dockerfile.${params.OS}"
                                label 'builder && epyc'
                                args "--userns=\"keep-id\" -v /orfeo/cephfs/opt/programs/${params.ARCH}/${params.OS}:/opt/programs/ -v /orfeo/cephfs/opt/modules:/opt/modules/"
                     }
              }
              steps {
                    dir("build/OpenBLAS") {
                            sh ''' ls /opt/programs
                               ls /opt/modules
                               source /etc/profile.d/modules.sh
                               [ -z "$LMOD_CMD" ] && exit 99
                               module use /opt/modules/*
                               module avail
                               module load openBLAS
                               '''
                               /*
                               mkdir -p  ${PREFIX}-omp
                               make USE_OPENMP=1 -j 128
                               make PREFIX=${PREFIX}-omp install
                               
                               make clean
                               mkdir -p  ${PREFIX}
                               make USE_OPENMP=0 -j 128
                               make PREFIX=${PREFIX} install
                               */
                        }
                     }
                   }
              }
       }


FROM quay.io/fedora/fedora:37

RUN dnf -y groupinstall "Development Tools" "Development Libraries" && dnf -y install gcc-fortran  procps-ng && \
  mkdir -p /u/builder/builder/
  


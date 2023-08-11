FROM quay.io/ansible/awx-ee:21.11.0
RUN pip3 install pynetbox netaddr pexpect py-pure-client purestorage dnspython python-ldap
USER root
RUN dnf install -y grub2-tools-minimal openssl
USER 1000
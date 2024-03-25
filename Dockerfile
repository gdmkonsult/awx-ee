FROM quay.io/ansible/awx-ee:24.0.0
USER root
RUN dnf install -y grub2-tools-minimal openssl gcc python38-devel openldap-devel helm
USER 1000
RUN pip3 install pynetbox netaddr pexpect py-pure-client purestorage dnspython python-ldap
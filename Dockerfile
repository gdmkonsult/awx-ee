FROM quay.io/ansible/awx-ee:21.11.0
RUN pip3 install pynetbox netaddr
RUN dnf install -y pexpect grub2-tools-minimal
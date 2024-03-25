FROM quay.io/ansible/awx-ee:24.0.0
USER root
RUN dnf install -y grub2-tools-minimal openssl gcc python3.9-devel openldap-devel
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && chmod +x get_helm.sh && ./get_helm.sh
USER 1000
RUN pip3 install pynetbox netaddr pexpect py-pure-client purestorage dnspython python-ldap
FROM quay.io/ansible/awx-ee:24.6.1
USER root
RUN dnf install -y grub2-tools-minimal openssl gcc python3.9-devel openldap-devel butane
RUN wget https://github.com/nutanix/nutanix.ansible/archive/refs/heads/main.zip -O /tmp/ncp.zip
RUN unzip ncp.zip -d /tmp/ncp && cd /tmp
RUN ansible-galaxy collection build /tmp/ncp/nutanix.ansible-main/ && ansible-galaxy collection install /tmp/nutanix-ncp-2.1.1.tar.gz
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && chmod +x get_helm.sh && ./get_helm.sh && curl -fsSL -o /usr/local/bin/kubeadm https://dl.k8s.io/release/v1.29.3/bin/linux/amd64/kubeadm && chmod +x /usr/local/bin/kubeadm
RUN pip3 install pynetbox netaddr pexpect py-pure-client purestorage dnspython python-ldap passlib
USER 1000

FROM centos:centos7
MAINTAINER krishna.singh@naukri.com

RUN yum -y update; yum clean all; rm -rf /var/cache/yum
RUN yum -y install passwd openssh openssh-server openssh-clients initscripts sudo; yum clean all

RUN useradd krishna
RUN passwd -f -u krishna

RUN echo "krishna    ALL=(ALL)    ALL" >> /etc/sudoers.d/krishna

RUN /usr/sbin/sshd-keygen

RUN sed -ri 's/account    required     pam_nologin.so/#account    required     pam_nologin.so/' /etc/pam.d/login
RUN sed -ri 's/account    required     pam_nologin.so/#account    required     pam_nologin.so/' /etc/pam.d/sshd

RUN mkdir /var/run/sshd

COPY id_rsa.pub /home/krishna/.ssh/authorized_keys
RUN chown krishna /home/krishna/.ssh/authorized_keys
RUN chmod 600 /home/krishna/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]


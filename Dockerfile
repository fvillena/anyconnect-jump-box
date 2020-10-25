FROM ubuntu:18.04
RUN apt update
RUN apt install openconnect ssh openssh-server sshpass net-tools -y
RUN mkdir /var/run/sshd
RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
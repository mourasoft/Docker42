FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade \
		&& apt-get -y install \
		wget \
		openssh-server \
		ca-certificates \
		postfix \
		tzdata

RUN wget \
	 https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh \
		&& chmod 777 ./script.deb.sh && ./script.deb.sh
RUN apt-get install -y gitlab-ce
RUN mkdir /etc/gitlab/ssl && chmod 700 /etc/gitlab/ssl && openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/gitlab/ssl/key.key" -out "/etc/gitlab/ssl/key.crt" -subj "/C=MA/"
RUN sed -i -e "s/external_url 'http:\/\/gitlab.example.com'/external_url 'https:\/\/0.0.0.0\/'/g" /etc/gitlab/gitlab.rb
RUN echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/key.crt\"" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/key.key\"" >> /etc/gitlab/gitlab.rb
RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 1337" >> /etc/gitlab/gitlab.rb
RUN echo "Port 1337" >> /etc/ssh/ssh_config
Run echo "Port 1337" >> /etc/ssh/sshd_config
RUN service ssh start

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && service ssh restart && tail -f /etc/gitlab/gitlab.rb

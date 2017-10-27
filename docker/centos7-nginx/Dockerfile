FROM centos:centos7

RUN yum -y update
RUN yum -y upgrade
RUN yum -y install wget
RUN cd /etc/yum.repos.d && wget https://repo.codeit.guru/codeit.el`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`.repo
RUN yum -y install epel-release
RUN yum -y install nginx
RUN yum -y install npm
RUN yum clean all
RUN rm -rfv /etc/nginx/conf.d/*
RUN rm -v /etc/nginx/nginx.conf

RUN npm install \
  && npm install -g @angular/cli
#  && ng build --aot --prod \
#  && npm cache clean

ADD configs/nginx.conf /etc/nginx

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME /etc/nginx/conf.d/host.conf
VOLUME /var/www

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx"]

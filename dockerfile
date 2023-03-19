FROM  centos:latest

dnf -y --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf -y distro-sync
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip shine.zip
RUN cp -rvf shine/* .
RUN rm -rf shine shine.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

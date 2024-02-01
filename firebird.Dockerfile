FROM centos:7

COPY ./config/firebird/ /firebird/

RUN yum update -y

RUN yum localinstall -y /firebird/FirebirdSS-2.0.7.13318-0.i686.rpm

RUN yum autoremove -y

COPY firebird-docker-entrypoint.sh /

RUN chmod +x /firebird-docker-entrypoint.sh

VOLUME ["/firebird/db"]

ENTRYPOINT ["/firebird-docker-entrypoint.sh"]

EXPOSE 3050/tcp

CMD ["firebird"]
# based on CentOS because of the Openfire custom version specificities
FROM centos:7
MAINTAINER ALBERT FENG <albert.f@sandbox3.cn>

# update and upgrade the distribution
RUN yum update -y
RUN yum upgrade -y

# copy Openfire custom version
COPY data/openfire-3.9.1-1.i386.rpm /opt/openfire-3.9.1-1.i386.rpm

# install Openfire
RUN rpm -ivh /opt/openfire-3.9.1-1.i386.rpm

# delete Openfire-integrated plugins
WORKDIR "/opt/openfire/plugins"
RUN rm -f *.jar

# copy certificates for notifications feature
COPY data/development.p12 /opt/openfire/resources/keystore/development.p12
COPY data/production.p12 /opt/openfire/resources/keystore/production.p12

# copy plugins
COPY data/restAPI.jar /opt/openfire/plugins/restAPI.jar
COPY data/bstios.jar /opt/openfire/plugins/bstios.jar
COPY data/jobtalk.jar /opt/openfire/plugins/jobtalk.jar
COPY data/monitoring.jar /opt/openfire/plugins/monitoring.jar
COPY data/fileserver.jar /opt/openfire/plugins/fileserver.jar

# create the files storage directory
RUN mkdir -p /opt/openfire/upload/files

# install required packages
RUN yum install glibc.i686 net-tools vim -y

# set the volume for Openfire data
VOLUME /opt/openfire

# copy startup scripts
COPY entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

# Clear image
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

# run startup script
ENTRYPOINT ["/root/entrypoint.sh"]

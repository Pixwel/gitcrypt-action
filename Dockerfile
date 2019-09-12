FROM amazonlinux

RUN yum update
RUN yum -y install openssl-devel git;
RUN yum -y groupinstall "Development Tools";

WORKDIR /code
RUN git clone https://github.com/AGWA/git-crypt.git;
RUN cd git-crypt; make; make install;

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

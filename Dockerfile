FROM progrium/buildstep
MAINTAINER Fernando Mayo <fernando@tutum.co>

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libhunspell-1.3

ADD run.sh /run.sh
RUN chmod +x /run.sh

ONBUILD RUN mkdir -p /app
ONBUILD ADD . /app
ONBUILD RUN /build/builder

ENTRYPOINT ["/run.sh"]

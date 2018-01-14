FROM abernix/meteord:node-8.9.3-base

RUN apt-get update && apt-get install -y \
  libtool \
  automake \
  glib2.0 \
  glib2.0-dev

WORKDIR /opt

COPY mdbtools ./mdbtools

WORKDIR mdbtools

RUN autoreconf -i -f \
  && ./configure --disable-man \
  && make \
  && make install \
  && ldconfig

FROM haskell:latest

RUN mkdir -p /opt/server
WORKDIR /opt/server

RUN cabal update
COPY web.cabal /opt/server/web.cabal
RUN cabal install --only-dependencies -j4

COPY . /opt/server
RUN cabal install

CMD ["web"]
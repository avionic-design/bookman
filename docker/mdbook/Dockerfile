FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y wget 
RUN wget https://github.com/rust-lang/mdBook/releases/download/v0.4.12/mdbook-v0.4.12-x86_64-unknown-linux-gnu.tar.gz \
        && tar xf mdbook-v0.4.12-x86_64-unknown-linux-gnu.tar.gz                                                      \
        && cp mdbook /bin/mdbook                                                                                      \
        && chmod +x /bin/mdbook

WORKDIR "/usr/src"
ENTRYPOINT ["mdbook"]

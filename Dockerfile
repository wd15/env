FROM ubuntu:15.10
RUN apt-get -y update && apt-get install -y git
RUN useradd -m testuser
RUN runuser -l testuser -c "mkdir -p git; cd git; git clone https://github.com/wd15/env.git"



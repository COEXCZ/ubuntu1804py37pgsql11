FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt install -y gettext python3.7 python3.7-dev python3-pip curl ca-certificates
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 4
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 4
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 4
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt update
RUN apt install -y postgresql-server-dev-11 postgresql-client-11
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
RUN mkdir /store

FROM ubuntu:focal

ARG value

RUN apt-get update
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN TERM=vt100 apt-get install -y tzdata
RUN TERM=vt100 apt-get install -y texlive texlive-latex-extra make ghostscript
RUN TERM=vt100 apt-get install -y git
RUN mkdir -p /local

ENV DOCKER_USER=$value
RUN adduser --uid $DOCKER_USER texbuilder
USER $DOCKER_USER

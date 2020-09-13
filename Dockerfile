FROM ubuntu:focal

RUN apt-get update
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN TERM=vt100 apt-get install -y tzdata
RUN TERM=vt100 apt-get install -y texlive texlive-latex-extra make ghostscript
RUN TERM=vt100 apt-get install -y git
RUN mkdir -p /local

RUN adduser --uid 1000 texbuilder

USER 1000

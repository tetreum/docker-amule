FROM amd64/debian:buster

RUN cat /dev/null > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ buster main non-free contrib" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y locales amule-daemon && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y amule-daemon

# volumes and ports
VOLUME /config /downloads
EXPOSE 4711/tcp 4712/tcp 4672/udp 4665/udp 4662/tcp 4661/tcp 

ENTRYPOINT /usr/bin/amuled
CMD -c /config


FROM debian
RUN echo "deb http://ftp.fr.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list.d/kalliope && \
echo "deb-src http://ftp.fr.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list.d/kalliope

RUN apt-get update && apt-get install git
RUN git clone https://github.com/kalliope-project/kalliope.git /opt/kalliope
RUN cd /opt/kalliope && ./kalliope/install/install_kalliope.sh
CMD ["/bin/bash"]

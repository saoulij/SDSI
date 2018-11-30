FROM centos:centos7

RUN yum -y install dhclient-4.2.5-68.el7.centos
RUN yum -y install NetworkManager nc tcpdump vim dnsmasq iproute

RUN systemctl enable NetworkManager


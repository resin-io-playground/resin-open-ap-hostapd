FROM resin/rpi-raspbian:wheezy

RUN apt-get -q update && apt-get install -yq  net-tools firmware-ralink hostapd udhcpd nano rfkill iptables iproute dbus usbutils iw haveged wireless-tools wpasupplicant --no-install-recommends

COPY . /app
RUN chmod +x /app/init.sh

RUN mv /etc/udhcpd.conf /etc/udhcpd.conf.bak && cp /app/udhcpd.conf /etc/udhcpd.conf

RUN mv /etc/default/udhcpd /etc/default/udhcpd.bak && cp /app/udhcpd /etc/default/udhcpd

RUN cp /app/hostapd.conf /etc/hostapd/hostapd.conf

CMD ["/app/init.sh"]
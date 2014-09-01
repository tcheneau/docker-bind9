From debian
Maintainer Tony Cheneau "tony.cheneau@amnesiak.org"
Run DEBIAN_FRONTEND=noninteractive apt-get update && \
                                   apt-get install -y bind9 
# Add default configuration files (slightly modified ffrom the Debian project)
Add files/etc_bind_named.conf /etc/bind/named.conf
Add files/etc_bind_log.conf /etc/bind/log.conf
Add files/etc_bind_named.conf.options /etc/bind/named.conf.options
Add files/etc_bind_named.conf.default-zones /etc/bind/named.conf.default-zones 
Add files/etc_bind_db.0 /etc/bind/db.0
Add files/etc_bind_db.255 /etc/bind/db.255
Add files/etc_bind_db.local /etc/bind/db.local
Add files/etc_bind_db.127 /etc/bind/db.127
Add files/etc_bind_db.empty /etc/bind/db.empty
Add files/etc_bind_db.root /etc/bind/db.root

# Probably doesn't work
Add files/etc_resolv.conf /etc/resolv.conf

Run mkdir -p /var/run/named
Volume [ "/etc/bind/realconf", "/var/bind" ]
Expose 53/tcp
Expose 53/udp
Cmd [ "/usr/sbin/named", "-g", "-4" ]

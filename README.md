Bind9 master image for Docker
=============================

Rational
---------

When looking around on the Docker Hub, I could not find any Bind version 9 image that
matched my needs. Admittedly, I did not look too hard and it gave me the
perfect excuse to write my own Dockerfile.

Building
--------

    git clone https://github.com/tcheneau/docker-bind9.git
    sudo docker build  -t "tcheneau/bind9" .

Configuring
-----------

Edit the configuration files in the etc directory to match your zones.
Add your zones in the zones directory.

Your files (and directories that contains them) should be readable to the bind user (UID 101) when the program is run with the chroot argument (default behavior using the Dockerfile).

Running
-------

    sudo docker run -d -v $PWD/etc:/etc/bind/realconf -p 53:53/tcp -p 53:53/udp -v $PWD/zones:/var/cache/bind/zones -t "tcheneau/bind9"


Caveats
-------

 * logging is currently limited by the Docker facility: the log file will grow without bounds and will not rotate. Logging is set to "debug".
 * daemon runs as root (I still have to find how to properly run the daemon as the user "bind")

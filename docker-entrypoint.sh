#!/usr/bin/env bash

cd /etc/squid
mkdir ssl_cert
chown squid:squid ssl_cert
cd ssl_cert
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout proxyCA.pem  -out proxyCA.pem


if [[ "$1" == "squid" ]]; then
    shift;
    /usr/sbin/squid ${@}
else
    exec ${@}
fi


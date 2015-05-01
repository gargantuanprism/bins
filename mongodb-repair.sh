#!/bin/bash

systemctl stop mongodb
rm /var/lib/mongodb/mongod.lock
mongod --dbpath /var/lib/mongodb/ --repair
chown -R mongodb: /var/{log,lib}/mongodb/
systemctl start mongodb

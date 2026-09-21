#!/usr/bin/env bash

max=$(( $(od -An -N1 -tu2 /dev/urandom) % 63 + 16 ))

special='!@#$%^&*()-_=+{}<>,.?/:;|~'
alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789${special}"

pw=$(LC_ALL=C tr -dc "$alphabet" < /dev/urandom | head -c "$((max - 1))")
pw+=$(LC_ALL=C tr -dc "$special" < /dev/urandom | head -c 1)

printf '%s\n' "$pw"
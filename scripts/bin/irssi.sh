#!/bin/bash
docker run -it -v /etc/localtime:/etc/localtime -v "${HOME}/.irssi":/home/user/.irssi irssi config in container --read-only  --name irssi jess/irssi

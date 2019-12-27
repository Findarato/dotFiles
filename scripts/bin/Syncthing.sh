podman run --rm \
  --name=syncthing \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v ${HOME}/docker/syncthing/config:/config:z \
  -v ${HOME}/Documents:/mnt/documents:z \
  -v ${HOME}/Pictures/tapet:/mnt/tapet:z \
  --security-opt label=disable \
  linuxserver/syncthing

# podman rm syncthing

echo "fs.inotify.max_user_watches=204800" | sudo tee -a /etc/sysctl.conf
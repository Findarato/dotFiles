docker run --name=FileBotUI \
-e WIDTH=1280 \
-e HEIGHT=720 \
-p 3389:3389 \
-p 8080:8080 \
-v /mnt/tarvalon/storage/Movies:/media:rw \
-v /docker/containers/FileBotUi/config:/config:rw \
coppit/filebot


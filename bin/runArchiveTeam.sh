docker run \
  --detach \
  --env DOWNLOADER="Findarato" -e \
  --env SELECTED_PROJECT="auto" \
  --publish 8001:8001 \
   --restart always \
  archiveteam/warrior-dockerfile

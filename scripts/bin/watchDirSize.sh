SIZE=$(du -h -s | grep "total" | cut -c1-5 )

echo ${SIZE}

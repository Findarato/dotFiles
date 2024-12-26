TARGET_HOST=$1

# Remove the old key(s) from known_hosts
ssh-keygen -R $TARGET_HOST

# Add the new key(s) to known_hosts (and also hash the hostname/address)
ssh-keyscan -H $TARGET_HOST >> ~/.ssh/known_hosts
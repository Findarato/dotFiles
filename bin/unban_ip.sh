IPADDR=${1}
fail2ban-client set sshd unbanip ${IPADDR}

#!/usr/bin/env bash
####################################################################################
# Slack Bash console script for sending messages.
####################################################################################
# Installation
#    $ curl -s https://gist.githubusercontent.com/andkirby/67a774513215d7ba06384186dd441d9e/raw --output /usr/bin/slack
#    $ chmod +x /usr/bin/slack
####################################################################################
# USAGE
# Send message to slack channel/user
#   Send a message to the channel #ch-01
#     $ slack '#ch-01' 'Some message here.'
#
#   Send a message to the channel #ch-01 and user @me.
#     $ slack '#ch-01,@me' MESSAGE
#
#   Send a message to the default channel (it must be declared in APP_SLACK_CHANNEL).
#     $ slack  MESSAGE
#
# VARIABLES
#
# Please declare environment variables:
#   - APP_SLACK_WEBHOOK
#   - APP_SLACK_CHANNEL (optional)
#   - APP_SLACK_USERNAME (optional)
#   - APP_SLACK_ICON_EMOJI (optional)
# You may also declare them in ~/.slackrc file.
####################################################################################


set -o pipefail
set -o errexit
set -o nounset
#set -o xtrace

init_params() {
  # you may declare ENV vars in /etc/profile.d/slack.sh
  if [ -z "${APP_SLACK_WEBHOOK:-}" ]; then
    echo 'error: Please configure Slack environment variable: ' > /dev/stderr
    echo '  APP_SLACK_WEBHOOK' > /dev/stderr
    exit 2
  fi

  APP_SLACK_USERNAME=${APP_SLACK_USERNAME:-$(hostname | cut -d '.' -f 1)}

  APP_SLACK_ICON_EMOJI=${APP_SLACK_ICON_EMOJI:-:slack:}
  if [ -z "${1:-}" ]; then
    echo 'error: Missed required arguments.' > /dev/stderr
    echo 'note: Please follow this example:' > /dev/stderr
    echo '  $ slack.sh "#CHANNEL1,CHANNEL2" Some message here. ' > /dev/stderr
    exit 3
  fi

  slack_channels=(${APP_SLACK_CHANNEL:-})
  if [ "${1::1}" == '#' ] || [ "${1::1}" == '@' ]; then
    # explode by comma
    IFS=',' read -r -a slack_channels <<< "${1}"
    shift
  fi
  slack_message=${@}
}


send_message() {
  local channel=${1}
  echo 'Sending to '${channel}'...'
  curl --silent --data-urlencode \
    "$(printf 'payload={"text": "%s", "channel": "%s", "username": "%s", "as_user": "true", "link_names": "true", "icon_emoji": "%s" }' \
        "${slack_message}" \
        "${channel}" \
        "${APP_SLACK_USERNAME}" \
        "${APP_SLACK_ICON_EMOJI}" \
    )" \
    ${APP_SLACK_WEBHOOK} || true
  echo
}

send_message_to_channels() {
  for channel in "${slack_channels[@]:-}"; do
    send_message "${channel}"
  done
}

slack() {
  # Set magic variables for current file & dir
  __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
  readonly __dir __file

  cd ${__dir}

  if [ -f $(cd; pwd)/.slackrc ]; then
    . $(cd; pwd)/.slackrc
  fi

  if [ -f $HOME/.slackrc ]; then
    . $HOME/.slackrc
  fi

  declare -a slack_channels

  init_params ${@}
  send_message_to_channels
}

if [ "${BASH_SOURCE[0]:-}" != "${0}" ]; then
  export -f slack
else
  slack ${@}
  exit $?
fi

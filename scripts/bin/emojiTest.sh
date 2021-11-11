EMOJIS=(🥯  🦆 🦉 🥓 🦄 🦀 🖕 🍣 🍤 🍥 🍡 🥃 🥞 🤯 🤪 🤬 🤮 🤫 🤭 🧐 🐕 🦖 👾 🐉 🐓 🐋 🐌 🐢)

RANDOM_EMOJI() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
}
EMJ() {
  emj
}

RANDOM_EMOJI

echo "♥👍😍🙊🥱🥺✨✅🎊🏄"
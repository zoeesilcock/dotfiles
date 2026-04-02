main() {
  local pacman_tooltip=$(pacman -Qu)
  local yay_tooltip=$(yay -Qu)
  command printf "{ \"text\": \"󰣇\", \"tooltip\": \"<tt>pacman:\r%s\ryay:\r%s</tt>\" }" "$pacman_tooltip" "$yay_tooltip" | sed ':a;N;$!ba;s/\n/\r/g'
}

main "$@"

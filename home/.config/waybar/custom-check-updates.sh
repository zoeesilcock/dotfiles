main() {
  local pacman_tooltip=$(pacman -Qu | wc -l)
  local yay_tooltip=$(yay -Qu | wc -l)
  command printf "{ \"text\": \"󰣇\", \"tooltip\": \"<tt>pacman: %s ___ %s :yayman</tt>\" }" "$pacman_tooltip" "$yay_tooltip" | sed ':a;N;$!ba;s/\n/\r/g'
}

main "$@"

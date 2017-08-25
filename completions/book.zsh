if [[ ! -o interactive ]]; then
    return
fi

compctl -K _book book

_book() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(book commands)"
  else
    completions="$(book completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

#!/usr/bin/env bash

get_tmux_option() {
	local option=$1
	local default_value=$2
	option_value=$(tmux show-option -gqv "$option")
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

read_file() {
	local file=$1
	if [ -f "$1" ]; then
		cat "$1"
	else
		echo -1
	fi
}

remove_file() {
	local file=$1
	if [ -f "$file" ]; then
		rm "$file"
	fi
}

write_to_file() {
	local data=$1
	local file=$2
	echo "$data" >"$file"
}

increment_file_value() {
  local file=$1
  local limit=$2

  if [ ! -f "$file" ]; then
      echo "0" > "$file"
  else
      content=$(cat "$file")
      if [ "$content" -lt "$limit" ]; then
          echo $((content + 1)) > "$file"
      else
          echo "1" > "$file"
      fi
  fi
}


#!/bin/bash

current_space_index=$(yabai -m query  --spaces --space | jq '.index')


display_count=$(yabai -m query  --displays | jq '. | length')


display_index=0
while [ "$display_index" -lt "$display_count" ]; do

  min_index_sub_cmd="yabai -m query  --displays | jq  '.[${display_index}].spaces | .[0]'"
  min_spaces_index=$(eval $min_index_sub_cmd)

  max_index_sub_cmd="yabai -m query  --displays | jq  '.[${display_index}].spaces | .[-1]'"
  max_spaces_index=$(eval $max_index_sub_cmd)

  if [[ $min_spaces_index -le $current_space_index && $current_space_index -le $max_spaces_index ]]
  then 
	  if [[ $current_space_index -lt $max_spaces_index ]]
	  then
  		current_space_index=$(($current_space_index + 1))
	  fi
  fi
  display_index=$(($display_index + 1))
done

echo ${current_space_index}

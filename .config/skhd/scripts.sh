#!/usr/bin/env zsh

_cycle_focus_stack_next() {
  curr_window_id=$(yabai -m query --windows --window | jq ".id")
  last_window_id=$(yabai -m query --windows --window stack.last | jq ".id")

  echo $curr_window_id
  echo $last_window_id

  if [ $curr_window_id = $last_window_id ]; then
    yabai -m window --focus stack.first
  else
    yabai -m window --focus stack.next
  fi
}

_cycle_focus_stack_prev() {
  curr_window_id=$(yabai -m query --windows --window | jq ".id")
  first_window_id=$(yabai -m query --windows --window stack.first | jq ".id")

  if [ $curr_window_id = $first_window_id ]; then
    yabai -m window --focus stack.last
  else
    yabai -m window --focus stack.prev
  fi
}

_cycle_focus_bsp_next() {
  curr_window_id=$(yabai -m query --windows --window | jq ".id")
  last_window_id=$(yabai -m query --windows --window last | jq ".id")

  if [ $curr_window_id = $last_window_id ]; then
    yabai -m window --focus first
  else
    yabai -m window --focus next
  fi
}

_cycle_focus_bsp_prev() {
  curr_window_id=$(yabai -m query --windows --window | jq ".id")
  last_window_id=$(yabai -m query --windows --window first | jq ".id")

  if [ $curr_window_id = $last_window_id ]; then
    yabai -m window --focus last
  else
    yabai -m window --focus prev
  fi
}

cycle_focus_next() {
  layout=$(yabai -m query --spaces --space | jq ".type")

  if [ $layout = "\"bsp\"" ]; then
    _cycle_focus_bsp_next
  else
    _cycle_focus_stack_next
  fi
}

cycle_focus_prev() {
  layout=$(yabai -m query --spaces --space | jq ".type")

  if [ $layout = "\"bsp\"" ]; then
    _cycle_focus_bsp_prev
  else
    _cycle_focus_stack_prev
  fi
}

cycle_focus_up() {
  layout=$(yabai -m query --spaces --space | jq ".type")

  if [ $layout = "\"bsp\"" ]; then
    yabai -m window --focus north
  else
    _cycle_focus_stack_prev
  fi
}

cycle_focus_down() {
  layout=$(yabai -m query --spaces --space | jq ".type")

  if [ $layout = "\"bsp\"" ]; then
    yabai -m window --focus south
  else
    _cycle_focus_stack_next
  fi
}

cycle_layout() {
  json=$(yabai -m query --spaces --space)
  index=$(jq ".index" <<< $json)
  layout=$(jq ".type" <<< $json)

  if [ $layout = "\"bsp\"" ]; then
    yabai -m space --layout stack
    yabai -m config --space $index left_padding 38

    sketchybar --trigger space_type_change TYPE=stack
  else
    yabai -m space --layout bsp
    yabai -m config --space $index left_padding 5

    sketchybar --trigger space_type_change TYPE=bsp
  fi
}


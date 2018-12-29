#! /bin/bash

layout=${_layouts:0:2}
layouts=${_layouts:3:10}-$layout
indicator=$(echo $layout | tr '[:lower:]' '[:upper:]') 

setxkbmap -layout $layout

result='{ "full_text":"%s", "_layouts":"%s" }\n'
printf "$result" "$indicator" "$layouts"

exit 0

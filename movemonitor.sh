w=$(xdotool getactivewindow)
wmctrl -ir $w -b remove,maximized_vert,maximized_horz
xdotool windowmove $w $1 $2
#wmctrl -ir $w -b add,maximized_vert,maximized_horz

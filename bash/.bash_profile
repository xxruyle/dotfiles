# keyboard repeat and delay rates
xset r rate 275 30

# set mouse speed 
MOUSE_NAME="SteelSeries SteelSeries Rival 3"  # enter mouse name here 
MOUSE_SPEED=-0.37
MOUSE_ID=$(xinput --list | grep "$MOUSE_NAME" | grep -v Keyboard | sed -n 's/.*id=\([0-9]\+\).*/\1/p')
if [[ -n "$MOUSE_ID" ]]; then
  echo "Mouse (" $MOUSE_NAME ") found: " $MOUSE_ID  
  xinput --set-prop $MOUSE_ID "libinput Accel Speed" $MOUSE_SPEED
else 
  echo "Mouse not found"
fi


# random wallpaper 
nitrogen --set-zoom-fill --random

source ~/.bashrc

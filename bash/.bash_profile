# keyboard repeat and delay rates
echo "Setting keyboard rates"
xset r rate 275 30

# set mouse speed 
MOUSE_NAME="SteelSeries SteelSeries Rival 3"  # enter mouse name here 
MOUSE_SPEED=-0.37
MOUSE_ID=$(xinput --list | grep "$MOUSE_NAME" | grep -v Keyboard | sed -n 's/.*id=\([0-9]\+\).*/\1/p')
if [[ -n "$MOUSE_ID" ]]; then
  echo "Mouse (" $MOUSE_NAME ") found: " $MOUSE_ID  
  xinput --set-prop $MOUSE_ID "libinput Accel Speed" $MOUSE_SPEED

  echo "Mouse ($MOUSE_NAME id:$MOUSE_ID) set to accel speed $MOUSE_SPEED"

  xinput --set-prop $MOUSE_ID 'libinput Accel Profile Enabled' 0, 1
  echo "Mouse ($MOUSE_NAME id:$MOUSE_ID) disabling mouse acceleration"
else 
    echo "Mouse ($MOUSE_NAME) not found"
fi


# random wallpaper 
echo "Setting random wallpaper"  
nitrogen --set-zoom-fill --random

echo "Running bashrc" 
source ~/.bashrc

#!/usr/bin/bash
apt_reqs=(
    "i3" 
    "kitty" 
    "scrot" 
    "fastfetch" 
    "picom" 
    "polybar"
)

font_tmp_path="/tmp/fonts"
font_sys_path="/usr/share/fonts"
font_usr_path="$HOME/.local/share/fonts"

apt_requirements() {
    # apt stuff 
    for req in "${apt_reqs[@]}"; do
        sudo apt install $req -y 
    done
}

download_font() {
    # $1: The url of the form https://github.com/.../font.zip
    font_url=$1 
    wget -P $font_tmp_path $font_url  
    zip_file_name=$(echo $font_url | rev | cut -d '/' -f 1 | rev) # get zip file name 
    zip_file_name_stripped=$(echo $zip_file_name | cut -d '.' -f 1)
    mkdir -p "${font_usr_path}/${zip_file_name_stripped}"
    unzip "${font_tmp_path}/${zip_file_name}" -d "${font_usr_path}/${zip_file_name_stripped}"
    rm "${font_tmp_path}/${zip_file_name}" # clean up 
    fc-cache
}


# drivers() {
#     # nvidia drivers 
#
#     # append to sources.list (ASSUMING TRIXIE)
# }
#
#
# steam() {
#
# }

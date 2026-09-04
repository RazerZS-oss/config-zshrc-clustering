# Override cd to automatically execute eza
cd() {
  builtin cd "$@" && /opt/homebrew/bin/eza --icons
}

magic_pipe_cd() {
  if [[ "$BUFFER" == *" && cd "* ]]; then
    BUFFER="${BUFFER// && cd / && cd }"
  fi
  zle .accept-line
}
zle -N accept-line magic_pipe_cd

# Refresh and move Wi-Fi SSID to top priority (Index 0)
wifipri() {
    if [[ -z "$1" ]]; then
        echo "Usage: wifipri \"SSID Name\""
        return 1
    fi
     
    local ssid="$1"
    local interface="en0"
     
    echo "Updating Wi-Fi priority for: $ssid..."
     
    sudo networksetup -removepreferredwirelessnetwork "$interface" "$ssid" 2>/dev/null
    sudo networksetup -addpreferredwirelessnetworkatindex "$interface" "$ssid" 0 WPA2Personal
     
    echo "Done! '$ssid' is now set to top priority."
}

# Clear chpwd hook so 'cd' does not auto-run 'ls'
unfunction chpwd 2>/dev/null

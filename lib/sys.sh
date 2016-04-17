
sys.has_brew(){
	! sys.has 'brew' && return 1               # no brew available
	sys.has 'brew' && [ -z "$1" ] && return 0  # brew found and no $1? return true.
	! test -z "`brew ls --versions $1`"        # if $1, check if exists
}

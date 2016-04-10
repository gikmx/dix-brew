#! /usr/bin/env bash
[ ! $DIX ] && >&2 echo "${BASH_SOURCE[0]}:DIX404" && exit 1

# TODO: Haven't found a way to validate  that $1 is actually an array

# $1: Has to be an array in this form Packages[@] (no $)
# $2: Has to be a function.
brew.install(){

	# convert $1 back to an array
	declare -a pkgs=("${!1}")

	for pkg in "${pkgs[@]}"; do

		# convert to array so we can extract parts
		name=(${pkg// / })
		name=${name[0]}

		# Skip already-installed packages
		sys.has_brew "$name" && continue

		# if a function is sent as $2 call it after each successfull install
		log.info "Installing $name"
		if type.is_func $2; then
			TERM=xterm-256color brew install ${pkg[@]} && $2 $name
		else
			TERM=xterm-256color brew install ${pkg[@]}
		fi
	done
}
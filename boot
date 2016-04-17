#! /usr/bin/env bash
! $DIX && >&2 echo "DIX_MISSING" && exit 1

DIX_ON_AFTER(){
	show.title "$DIX_PKG booted successfully"
}

show.title "Booting $DIX_PKG"
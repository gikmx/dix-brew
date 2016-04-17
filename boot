#! /usr/bin/env bash
! $DIX && >&2 echo "DIX_MISSING" && exit 1

DIX_ON_AFTER(){
	log.info "$DIX_PKG Installed successfully"
}

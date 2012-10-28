#installs TKLPatch (SDK from http://turnkeylinux/org)
#Scripted by Rik Goldman from TKL Documentation at http://www.turnkeylinux.org/docs/tklpatch/installation
#RUN AS ROOT
	#from raspian
	#1. sudo passwd root
	#2. enter new root passwd twice
	#3. logout
	#4. Login as root with the new password

# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#install function
install ()
{
	apt-get update
	DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o DPkg::Options::=--force-confdef \
        -o DPkg::Options::=--force-confold \
        install $@
}

#Install Dependencies
install build-essential \
	make \
	git-core \
	tar \
	gzip

#Get TKLPatch Source
git clone git://github.com/turnkeylinux/tklpatch.git /tmp/tklpatch

#Make TKLPatch
cd /tmp/tklpatch
make install

#Apply Patch to root of filesystem by root
tklpatch-apply / webide.tar.gz





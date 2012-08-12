
BASEDIR=$HOME/.bashrc.d
DEBUG=false

function do_source {
	if $DEBUG; then
		echo "Sourcing $1..."
	fi
	source $1
}

# Pre scripts
for script in $(ls $BASEDIR/pre.d/*.sh 2> /dev/null | sort -n); do
	do_source $script
done

# OS Specific
if [ -f $BASEDIR/os.d/$(uname -s).sh ]; then
	do_source $BASEDIR/os.d/$(uname -s).sh
fi

# Host Specific
if [ -f $BASEDIR/host.d/$(hostname -s).sh ]; then
	do_source $BASEDIR/host.d/$(hostname -s).sh
fi

# Post scripts
for script in $(ls $BASEDIR/post.d/*.sh 2> /dev/null | sort -n); do
	do_source $script
done
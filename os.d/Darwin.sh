# Is brew installed?
if [ -x $(which brew) ]; then
	BREW_PREFIX=$(brew --prefix)

	# Add brew and other locals to the list first
	export PATH=$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH
else
	echo "brew is not installed.  Concider installing it."
fi

# Use color gnu ls if available
if [ -x /usr/local/bin/gls ]; then
        alias ls='/usr/local/bin/gls --color -F'
else
	echo "gls is not installed.  Install it with 'brew install coreutils'."
fi	

# Use sublime as our editor if it is installed
if [ -f $(which subl) ]; then
	export EDITOR='subl --wait'
fi
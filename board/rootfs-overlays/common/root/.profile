export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin

if [ "$PS1" ]; then
	export PS1='\u@\h:\w\$ '
fi

export PAGER='/bin/more '
export EDITOR='/bin/nano '

# Source configuration files from /etc/profile.d
for i in /etc/profile.d/*.sh ; do
	if [ -r "$i" ]; then
		. $i
	fi
	unset i
done

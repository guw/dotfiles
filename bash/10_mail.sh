
# Send mail on login
if is_ubuntu; then
  echo "User $USER logged in @ web.wagenknecht.org on: `date` `who`" | mail -s "Login: GUNNAR@WAGENKNECHT.ORG from `who | cut -d"(" -f2 | cut -d")" -f1`" root
fi



# Send mail on login
if is_ubuntu; then
  echo -e "User: $USER\nHost: `hostname -f`\n`date`\n\nWho:\n`who`" | mail -s "Login: $USER from `who | cut -d"(" -f2 | cut -d")" -f1`" root
fi


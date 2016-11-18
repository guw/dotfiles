# Send mail on login
if [[ (is_ubuntu || is_raspbian) &&  -x /usr/bin/mail  ]]; then
  echo -e "User: $USER\nHost: `hostname -f`\n`date`\n\nWho:\n`who`" | mail -s "Login: $USER from `who | cut -d"(" -f2 | cut -d")" -f1 | tr "\n" " "`" root
fi

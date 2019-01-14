#!/usr/bin/env bash

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# find out where I am
# (requires brew install locateme timelimit)
# (we use timelimit because of https://github.com/netj/LocateMe/issues/2)
location=$(timelimit -p -t 2 -T 2 LocateMe -l)
if [ $? -eq 0 ]; then
  latitude=$(echo "${location}" | awk '/Latitude: / {print $2}')
  longitude=$(echo "${location}" | awk '/Longitude: / {print $2}')
  response=$(curl --connect-timeout 3 --max-time 5 -s "http://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&sensor=false")
	if [ $? -ne 0 ]; then
	  error_message=$(echo ${response} | jq -r '.error_message ')
	  echo -e "Google Maps API failed: ${error_message}"
	  return 1
	fi
  locality=$(echo ${response} | jq -r '.results | .[0] | .address_components[] | select(.types==["locality","political"]) | .long_name')
  locality_short=$(echo ${response} | jq -r '.results | .[0] | .address_components[] | select(.types==["locality","political"]) | .short_name')
  state=$(echo ${response} | jq -r '.results | .[0] | .address_components[] | select(.types==["administrative_area_level_1","political"]) | .short_name')
  country=$(echo ${response} | jq -r '.results | .[0] | .address_components[] | select(.types==["country","political"]) | .short_name')
  echo -e "Welcome to \e[1m${locality}\e[0m."

  export LOCATION_LOCALITY="${locality}"
  export LOCATION_LOCALITY_SHORT="${locality_short}"
  export LOCATION_STATE="${state}"
  export LOCATION_COUNTRY="${country}"
fi

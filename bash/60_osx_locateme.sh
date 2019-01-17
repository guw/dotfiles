#!/usr/bin/env bash

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

if [ -z "${GEOCODE_API_KEY}" ]; then
  echo -e "\e[3mUnable to identify location. Please get an API key and export it as GEOCODE_API_KEY.\e[0m"
  return 1
fi

# find out where I am
# (requires brew install locateme timelimit)
# (we use timelimit because of https://github.com/netj/LocateMe/issues/2)
echo -en "\e[3mDetecting location. \e[0m"
location=$(timelimit -p -t 2 -T 2 LocateMe -l)
if [ $? -eq 0 ]; then
  latitude=$(echo "${location}" | awk '/Latitude: / {print $2}')
  longitude=$(echo "${location}" | awk '/Longitude: / {print $2}')
  response=$(curl --connect-timeout 3 --max-time 5 --silent --fail "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&sensor=false&key=${GEOCODE_API_KEY}")
  response_exitcode=$?
  response_status=$(echo ${response} | jq -r '.status ')
	if [[ $response_exitcode -ne 0 || "${response_status}" != "OK" ]]; then
	  error_message=$(echo ${response} | jq -r '.error_message ')
	  echo -e "Google Maps API failed: \e[1m${response_status}\e[0m - ${error_message}"
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
else
  echo -e "\e[3mUnable to identify location.\e[0m"
fi

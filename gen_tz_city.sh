#!/bin/bash

counter=1
echo "[
"

while read line
do
   city=`echo $line | awk -F, '{print $1}'`
   state=`echo $line | awk -F, '{print $2}'`
   olson=`echo $line | awk -F, '{print $3}'`

   if test "$counter" -ge 2
   then
   echo ","
   fi

   echo "
   {     
      \"pk\": $counter,
      \"model\": \"profiles.timezones_by_us_city\",
      \"fields\": {
         \"city\": \"${city}\",
         \"state_abbrev\": \"${state}\",
         \"olson_timezone\": \"${olson}\"
      }
   }
   "
   counter=$(( $counter + 1 ))

done < ~/Timezone-Mappings-in-CSV-format/us_cities_to_tz.csv

echo "]
"

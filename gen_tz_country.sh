#!/bin/bash

counter=1

echo "[
"

while read line
do
   country=`echo $line | awk -F, '{print $1}'`
   olson=`echo $line | awk -F, '{print $2}'`

   if test "$counter" -ge 2
   then
   echo ","
   fi

   echo "
   {     
      \"pk\": $counter,
      \"model\": \"profiles.timezones_by_country_code\",
      \"fields\": {
         \"country_code\": \"${country}\",
         \"olson_timezone\": \"${olson}\"
      }
   }
   "
   counter=$(( $counter + 1 ))

done < ~/Timezone-Mappings-in-CSV-format/countries_by_timezone.csv

echo "]
"

#!/usr/bin/env bash

chart=""
values=""
args=("$@")
for i in "${!args[@]}"; do 
	if [ "$i" = "0" ]
	then
	    chart=${args[$i]}
	else
	    values="$values -f ${args[$i]}"
	fi
done

# Merge sit and client-a to values.yaml
helm values $chart $values -o $chart

# Filter out files in templates-dir and copy to tmp folder
helm filter $chart -o tmp

# Pack chart archive
helm package tmp/$chart

# Remove tmp folder 
rm -rf tmp 

# Restore values.yaml from backup file
mv $chart/values.yaml.bak $chart/values.yaml

exit 0
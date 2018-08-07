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

if [[ -z "$chart" ]]; then
  echo "chart is required";
  exit 1;
fi

# Merge sit and client-a to values.yaml
helm values $chart $values -o $chart || exit 1;

# Filter out files in templates-dir and copy to tmp folder
helm filter $chart -o tmp || exit 1;

# Pack chart archive
helm package tmp/$chart || exit 1;

# Remove tmp folder 
rm -rf tmp || exit 1;

# Restore values.yaml from backup file
mv $chart/values.yaml.bak $chart/values.yaml || exit 1;

exit 0

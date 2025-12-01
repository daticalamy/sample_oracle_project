#!/bin/bash

# ways to run this script:
# ./runme.sh <lbCommand> <OPTIONAL:targetSchema>
# examples:
#   ./runme.sh update
#   ./runme.sh rollbackOneUpdate schema2

export lbCommand="$1"
export targetSchema="$2"

# Add your flow file locations
export LIQUIBASE_SEARCH_PATH=.,flowfiles,policychecks,s3://asmith-s3-extension-demo/oracleSnapshots/

echo "lbCommand=$lbCommand"
echo "targetSchema=$targetSchema"

# Define schema list
schemas=("schema1" "schema2" "schema3")

for schema in "${schemas[@]}"; do

    # If targetSchema is set AND does not match current schema → skip it
    if [[ -n "$targetSchema" && "$schema" != "$targetSchema" ]]; then
        continue
    fi

    # Run for this schema
    echo "Running $lbCommand for schema=$schema"
    export schema
    liquibase flow

done
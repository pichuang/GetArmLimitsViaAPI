#!/bin/bash

az group create -l TaiwanNorth -n rg-anayltics --debug 2>&1 | tee create_resource_group.log

cat create_resource_group.log | grep "urllib3.connectionpool: https://management.azure.com:443"

# DEBUG: urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourcegroups/rg-anayltics?api-version=2022-09-01 HTTP/1.1" 201 226
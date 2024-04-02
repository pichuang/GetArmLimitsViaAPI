#!/bin/bash

az vmss delete --name MyVmss -g rg-anayltics --force-deletion --debug 2>&1 | tee delete_vmss.log

cat delete_vmss.log | grep "urllib3.connectionpool: https://management.azure.com:443"

# DEBUG: urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourcegroups/rg-anayltics?api-version=2022-09-01 HTTP/1.1" 201 226
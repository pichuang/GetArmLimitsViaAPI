#!/bin/bash


az vmss create -n MyVmss -g rg-anayltics --image Ubuntu2204 --instance-count 1 --data-disk-sizes-gb 2 --os-disk-size-gb 40 --debug 2>&1 | tee create_vmss.log

cat create_vmss.log | grep "urllib3.connectionpool: https://management.azure.com:443"

# DEBUG: urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourcegroups/rg-anayltics?api-version=2022-09-01 HTTP/1.1" 201 226
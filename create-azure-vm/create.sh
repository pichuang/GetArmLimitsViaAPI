#!/bin/bash

az vm create -n MyVm -g rg-anayltics --image Ubuntu2204 --debug 2>&1 | tee create_vm.log

cat create_vm.log | grep "urllib3.connectionpool: https://management.azure.com:443"

# DEBUG: urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourcegroups/rg-anayltics?api-version=2022-09-01 HTTP/1.1" 201 226
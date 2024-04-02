#!/bin/bash

az vm delete -n MyVm -g rg-anayltics --yes --debug 2>&1 | tee delete_vm.log

cat delete_vm.log | grep "urllib3.connectionpool: https://management.azure.com:443"

# DEBUG: urllib3.connectionpool: https://management.azure.com:443 "PUT /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourcegroups/rg-anayltics?api-version=2022-09-01 HTTP/1.1" 201 226
#!/bin/bash

az vmss scale --name MyVmss --new-capacity 2 --resource-group rg-anayltics --debug 2>&1 | tee scale_vmss_to_2.log

cat scale_vmss_to_2.log | grep "urllib3.connectionpool: https://management.azure.com:443"


# az vmss scale --name MyVmss --new-capacity 3 --resource-group rg-anayltics --debug 2>&1 | tee scale_vmss_to_3.log

# cat scale_vmss_to_3.log | grep "urllib3.connectionpool: https://management.azure.com:443"

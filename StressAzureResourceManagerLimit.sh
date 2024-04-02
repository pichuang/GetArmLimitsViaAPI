#!/bin/bash
echo "Log in to your Azure subscription..."
# az login

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
TENANT_ID=$(az account show --query tenantId -o tsv)
TOKEN=$(az account get-access-token --query accessToken -o tsv)

echo "Getting access ARM Throttle Limits for Subscription: $SUBSCRIPTION_ID"

URI="https://management.azure.com/subscriptions/$SUBSCRIPTION_ID/resourcegroups?api-version=2016-09-01"

PARALLEL_NUM=100

for i in {1..10000}
do
    REMAINING_READ_OPS=$(curl -X GET -H "Authorization: Bearer $TOKEN" --parallel --parallel-max ${PARALLEL_NUM} -s -o /dev/null -I -H "Content-Type: application/json" -w '%header{x-ms-ratelimit-remaining-subscription-reads}' $URI )
    # REMAINING_READ_OPS=$(echo $RESPONSE | grep -v "x-ms-ratelimit-remaining-subscription-reads")
    echo "Request ID #$i, Remaining Read Operations: $REMAINING_READ_OPS"
done

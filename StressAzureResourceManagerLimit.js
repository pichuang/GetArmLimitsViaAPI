import http from 'k6/http';
import { check, sleep } from 'k6';

// az account show --query id -o tsv
const subscriptionId = '';

// az account get-access-token --query accessToken -o tsv
const token = '';

const stages = [];
for (let t = 50; t <= 700; t += 50) {
  stages.push({ duration: '1s', target: t }, { duration: '1s', target: t });
}

export let options = {
    discardResponseBodies: true,
    scenarios: {
        contacts: {
            // https://k6.io/docs/using-k6/scenarios/executors/
            executor: 'ramping-arrival-rate',
            maxVUs: 10000,
            startRate: 10, // How many iterations per timeUnit
            timeUnit: "1s",
            preAllocatedVUs: 10,
            stages: stages
        },
    },
};

export default function () {

    let url = `https://management.azure.com/subscriptions/${subscriptionId}/resourcegroups?api-version=2016-09-01`;

    let params = {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
    };

    const res = http.get(url, params);

    // console.log("Response: " + JSON.stringify(res.headers));
    console.log("X-Ms-Ratelimit-Remaining-Subscription-Reads: " + res.headers["X-Ms-Ratelimit-Remaining-Subscription-Reads"]);

}

# GetArmLimitsViaAPI

- k6
- bash

## Test Results

| Case | GET | PUT | DELETE |
|:----:|:---:|:---:|:------:|
| Create Azure Resource Group | 0 | 1 | 0 |
| Create Azure VM | 15 | 1 | 0 |
| Create Azure VMSS | 10 | 1 | 0 |
| Scale Azure VMSS from 1 to 2 | 5 | 1 | 0 |
| Scale Azure VMSS from 1 to 3 | 5 | 1 | 0 |
| Scale Azure VMSS from 1 to 10 | 5 | 1 | 0 |
| Delete Azure VM | 2 | 0 | 1 |
| Delete Azure VMSS | 2 | 0 | 1 |


## How to collect all verbose logs

```bash
az xxx --debug 2>&1 | tee xxx
```


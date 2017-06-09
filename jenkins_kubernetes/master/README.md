Jenkins
===========


# Creating efs filesystem

Command:
```
aws efs create-file-system --creation-token 11223344
```

Output:

```
{
    "SizeInBytes": {
        "Value": 0
    },
    "CreationToken": "11223344",
    "CreationTime": 1492130533.0,
    "PerformanceMode": "generalPurpose",
    "FileSystemId": "fs-23e6328a",
    "NumberOfMountTargets": 0,
    "LifeCycleState": "creating",
    "OwnerId": "421757482782"
}
```

Command:

```
aws efs create-tags \
--file-system-id fs-23e6328a \
--tags "Key=Name,Value=k8s-cluster-1-jenkins"
```

DNS name is the:  fs-23e6328a.efs.us-west-2.amazonaws.com

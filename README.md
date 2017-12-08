## Install an HDFS Client to interact with Hadoop Cluster
### Build
Clone this repository

```bash
$ cd docker-hdfs-client
$ docker build . -t hdfs-client
```

### Run
```bash
$ docker run --rm -it --name hdfs hdfs-client /bin/bash
```
Once inside the container, you can run HDFS commands as the hdfs user.

_If you come across a Hadoop Cluster with no Kerberos Auth, you can have some real fun ;-)_


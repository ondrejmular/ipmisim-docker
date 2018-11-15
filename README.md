# Containerized IPMI mock server
Containerized [ipmisim](https://github.com/rhtyd/ipmisim) IPMI server

## Requirements
- [Docker](https://docs.docker.com/engine/installation/)
- make

## Usage
### Start server
Run `make up` to start the server on default port `623` or run `make up
PORT=<port>` for port customization.

### Testing server
```
[root@node ~]# ipmitool -I lanplus -H localhost -p 623 -R1 -U admin -P password chassis power status
Chassis Power is off
```
Or you can use `fence_ipmilan` from [fence-agents](https://github.com/ClusterLabs/fence-agents):
```
[root@node ~]# fence_ipmilan -a localhost -l admin -p password -P -u 623 -o status
Status: OFF
[root@node ~]# fence_ipmilan -a localhost -l admin -p password -P -u 623 -o on
Success: Powered ON
[root@node ~]# fence_ipmilan -a localhost -l admin -p password -P -u 623 -o status
Status: ON
```

### Stop server
Run `make down`

### Clean-up docker environment
Run `make clean`

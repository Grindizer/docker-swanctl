# site-2-site strongswan focuse with docker and coreos integratio.

Forked/inspired from the excellent project: https://github.com/philpl/docker-strongswan

## Usage

Run the following to start the container:

```
docker run --name sw-data grindizer/docker-swanctl /bin/true
docker run -d --name sw --privileged --volumes-from sw-data [--net host] -p 500:500/udp -p 1701:1701/udp -p 4500:4500/udp  grindizer/docker-swanctl```

docker logs -f sw
docker exec -it sw swanctl -S
docker exec -it sw ipsec statusall
```


## Volume / Configuration files

All related data on strongswan, ipsec, charon, vici will be mounted on /opt/swan/{bin,config,run}

If you run another container using --volumes-from sw-data, you will be able to control charon daemon either using swanctl 
or the vici (https://pypi.python.org/pypi/vici/) interface (here the Pytho binding :))

## Port mapped
* 4500/udp and 500/udp for IPSec 
* 1701/udp for L2TP

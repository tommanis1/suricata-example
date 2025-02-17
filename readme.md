# Suricata example
On your host machine build, build the docker image:
```
docker build -t suricata-container .
```

Then start a container:
```
docker run --rm -it \
    --net=host \
    -v $(pwd)/src/:/root/src \
    suricata-container


```

Now inside of the container start Suricata with the configuration in src/suricata.yaml:
```
suricata -c /root/src/suricata.yaml -i wlp1s0
```
Install the custom rules 
```

```

Now to trigger our rule we can include "virus" anywhere in a packet. Try running the following:
```
curl -H "User-Agent: virus" http://example.com
```


Looking at the output logs:
```
tail /var/log/suricata/fast.log
```

We should now see something like:

```
[1:1000001:1] Possible Virus Detected [**] [Classification: (null)]
```

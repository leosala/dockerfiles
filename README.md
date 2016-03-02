# dockerfiles

## Notes

In case you cannot build the images, it can be that your network is blocking the default DNS servers used by docker (`8.8.8.8` and `8.8.4.4`). Try editing e.g. `/etc/default/docker` in an ubuntu-based distro, and add:

```
DOCKER_OPTS="--dns ip_of_your_dns_server"
```

and then restart the docker daemon

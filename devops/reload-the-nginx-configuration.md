# Reload The nginx Configuration

The nginx service won't immediately start using a modified or replaced nginx
configuration. Once a `restart` or `reload` signal is received by nginx, it
will apply the changes. The `reload` signal

```
$ service nginx reload
```

tells nginx to reload the configuration. It will check the validity of the
configuration file and then spawn new worker processes for the latest
configuration. It then sends requests to shut down the old worker processes.
This means that during a *reload* nginx is always up and processing
requests.

[source](http://nginx.org/en/docs/beginners_guide.html)

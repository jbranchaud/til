# SSH to a host with a hop in the middle

You--->Firewall---->HopBox----->DestBox

If you have a complicated enough network, you may run into situations where
you need to use a 'gateway' box to gain access to a particular network 
segment, and from there you can ssh to the host you need to.  Having to
ssh twice and login twice is annoying and inconvenient.  Luckily, ssh 
has a provision for this.  It's called `proxyCommand`.  The only requirements
for using it are ssh and the nc or netcat program.

The command is as follows:

```
ssh -o ProxyCommand='ssh -T user@HopBox nc DestBox 22' user@DestBox
```

This tells ssh that before trying to get to DestBox, first run the
proxyCommand, which sets up a proxy from HopBox to DestBox on port 22
and forwards that traffic back to your ssh session.  This is equivalent
to what you would do manually if you first ssh'd into HopBox and then
ssh'd into DestBox.

If you do this sort of thing enough to be looking for shortcuts here,
you would be well served to set up some login keys and put this 
configuration into your 
`~/.ssh/config` file

host HopBox
    Port
    User
    IdentityFile ...
    ...

host DestBox
    Port
    User
    IdentityFile ...
    ...
    ProxyCommand ssh -T HopBox nc %h %p


The %n and %p are replaced with the host and port requested on the
commandline, so now if you use:

```
ssh DestBox
```

It's the equivalent of issuing the following command:
```
ssh -i <destbox_key> -o ProxyCommand='ssh -T -i <hopbox_key> user@HopBox nc DestBox 22' user@DestBox
```

Note that both the private keys need to reside on your local machine since
it's your local machine's ssh that is communicating with first the HopBox
and then the DestBox through the proxy.


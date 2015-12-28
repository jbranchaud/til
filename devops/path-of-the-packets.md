# Path Of The Packets

You can use `traceroute` to determine the network path packets follow from
your machine to some host server. For instance, if I want to know path
between my laptop (connected to airport wifi) and my website
[joshbranchaud.com](http://joshbranchaud.com), I can run the following
command:

```
$ traceroute joshbranchaud.com
traceroute to joshbranchaud.com (198.74.60.157), 64 hops max, 52 byte packets
 1  hotspot.boingohotspot.net (192.168.144.1)  1.209 ms  1.427 ms  1.080 ms
 2  192.168.13.1 (192.168.13.1)  5.272 ms  3.545 ms  6.231 ms
 3  10.106.144.1 (10.106.144.1)  13.671 ms  15.311 ms  12.895 ms
 4  68.13.10.184 (68.13.10.184)  14.789 ms  12.980 ms  13.628 ms
 5  68.13.8.221 (68.13.8.221)  19.922 ms  12.611 ms  17.853 ms
 6  nyrkbprj01-ae3.0.rd.ny.cox.net (68.1.5.157)  48.917 ms  56.641 ms  51.771 ms
 7  eqix.e-2-3.tbr2.ewr.nac.net (198.32.118.157)  62.977 ms  52.970 ms  48.667 ms
 8  0.e1-2.tbr2.mmu.nac.net (209.123.10.114)  66.253 ms  57.311 ms  52.242 ms
 9  207.99.53.46 (207.99.53.46)  57.478 ms  53.443 ms  54.510 ms
10  joshbranchaud.com (198.74.60.157)  59.853 ms  56.375 ms  55.393 ms
```

See `man traceroute` for more details.

# Check Services Listening on TCP Ports

Under Linux and UNIX you can use any one of the following command to get services on listining on TCP ports:

* `lsof`
* `netstat`

## `lsof`
`lsof` is a command meaning "list open files", which is used in many Unix-like systems to report a list of all open files and the processes that opened them. 

```
lsof -Pni | grep -i listen

```

Sample output:

```
COMMAND    PID     USER   FD   TYPE DEVICE SIZE NODE NAME
gweather- 6591     1000   17u  IPv4 106812       TCP 192.168.1.100:57179->140.90.128.70:80 (ESTABLISHED)
firefox-b 6613     1000   29u  IPv4 106268       TCP 127.0.0.1:60439->127.0.0.1:3128 (ESTABLISHED)
firefox-b 6613     1000   31u  IPv4 106321       TCP 127.0.0.1:60440->127.0.0.1:3128 (ESTABLISHED)
firefox-b 6613     1000   44u  IPv4 106325       TCP 127.0.0.1:60441->127.0.0.1:3128 (ESTABLISHED)
firefox-b 6613     1000   50u  IPv4 106201       TCP 127.0.0.1:60437->127.0.0.1:3128 (ESTABLISHED)
deluge    6908     1000    8u  IPv4  23179       TCP *:6881 (LISTEN)
deluge    6908     1000   30u  IPv4  23185       UDP *:6881
deluge    6908     1000   45u  IPv4 106740       TCP 192.168.1.100:50584->217.169.223.161:38406 (SYN_SENT)
deluge    6908     1000   57u  IPv4  70529       TCP 192.168.1.100:57325->24.67.82.222:21250 (ESTABLISHED)
deluge    6908     1000   58u  IPv4 106105       TCP 192.168.1.100:38073->24.16.233.1:48479 (ESTABLISHED)
..........
......
ssh       6917     1000    3u  IPv4  23430       TCP 10.1.11.3:42658->10.10.29.66:22 (ESTABLISHED)
```

First column **COMMAND** - gives out information about program name. Please see output header for details. For example, gweather* command gets the weather report weather information from the U.S National Weather Service (NWS) servers (140.90.128.70), including the Interactive Weather Information Network (IWIN) and other weather services.
Where,

* `-i`: Lists IP sockets.
* `-n`: Do not resolve hostnames (no DNS).
* `-P`: Do not resolve port names (list port number instead of its name).

One can also list Unix Sockets by using `lsof -U`.

##netstat
The `netstat` command symbolically displays the contents of various network-related data and information.

```
netstat -tulpn
```

OR

```
netstat -npl
```

Sample output:

```
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:6881            0.0.0.0:*               LISTEN     6908/python
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN     5562/cupsd
tcp        0      0 127.0.0.1:3128          0.0.0.0:*               LISTEN     6278/(squid)
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN     5854/exim4
udp        0      0 0.0.0.0:32769           0.0.0.0:*                          6278/(squid)
udp        0      0 0.0.0.0:3130            0.0.0.0:*                          6278/(squid)
udp        0      0 0.0.0.0:68              0.0.0.0:*                          4583/dhclient3
udp        0      0 0.0.0.0:6881            0.0.0.0:*                          6908/python   
```

Last column PID/Program name gives out information regarding program name and port.
Where,

* `-t` : TCP port
* `-u` : UDP port
* `-l` : Show only listening sockets.
* `-p` : Show the PID and name of the program to which each socket / port belongs
* `-n` : No DNS lookup (speed up operation)

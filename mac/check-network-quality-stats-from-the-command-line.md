# Check Network Quality Stats From The Command Line

MacOS comes with a little known CLI utility for checking your current network
quality statistics. It is aptly named `networkQuality`.

Here is what a basic run of the tool might output:

```bash
$ networkQuality

...
Downlink: capacity 281.430 Mbps, responsiveness 101 RPM - Uplink: capacity 16.629 Mbps, responsiveness 101 R
Downlink: capacity 285.534 Mbps, responsiveness 101 RPM - Uplink: capacity 16.028 Mbps, responsiveness 101 R
==== SUMMARY ====
Uplink capacity: 22.982 Mbps
Downlink capacity: 288.152 Mbps
Responsiveness: Low (93 RPM)
Idle Latency: 26.375 milliseconds
```

You can get an even more detailed summary with the `-v` option:

```bash
$ networkQuality -v

...
==== SUMMARY ====
Uplink capacity: 18.257 Mbps (Accuracy: High)
Downlink capacity: 469.355 Mbps (Accuracy: High)
Responsiveness: Medium (252 RPM) (Accuracy: High)
Idle Latency: 25.583 milliseconds (Accuracy: High)
Interface: en0
Uplink bytes transferred: 19.750 MB
Downlink bytes transferred: 488.265 MB
Uplink Flow count: 8
Downlink Flow count: 12
Start: 9/24/24, 11:06:20 AM
End: 9/24/24, 11:06:30 AM
OS Version: Version 13.5.2 (Build 22G91)
```

See `man networkQuality` for more details.

[source](https://cyberhost.uk/the-hidden-macos-speedtest-tool-networkquality/)

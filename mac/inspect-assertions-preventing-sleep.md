# Inspect Assertions Preventing Sleep

The `pmset` command is for inspecting and manipulating _Power Management
Settings_ on MacOS. The `-g` flag is for _getting_ details. We can get a summary
of power assertions with `-g assertions`. These assertions are ways that the
system and display are prevented from sleeping.

A common assertion preventing sleep is the user being active. Another example of
an assertion is a program like `caffeinate` that sets a timeout preventing sleep
for a fixed period of time.

Here I activate a 30 minute (1600 second) `caffeinate` session and then I
inspect the power management assertions which shows the details of that
assertion as well as two others.

```bash
❯ caffeinate -t 1600 &
[1] 98217

❯ pmset -g assertions
2025-11-02 13:20:57 -0600
Assertion status system-wide:
   BackgroundTask                 0
   ApplePushServiceTask           0
   UserIsActive                   1
   PreventUserIdleDisplaySleep    0
   PreventSystemSleep             0
   ExternalMedia                  0
   PreventUserIdleSystemSleep     1
   NetworkClientActive            0
Listed by owning process:
   pid 98217(caffeinate): [0x00045477000194b3] 00:00:03 PreventUserIdleSystemSleep named: "caffeinate command-line tool"
        Details: caffeinate asserting for 1600 secs
        Localized=THE CAFFEINATE TOOL IS PREVENTING SLEEP.
        Timeout will fire in 1597 secs Action=TimeoutActionRelease
   pid 145(WindowServer): [0x00044f2f00099212] 00:00:00 UserIsActive named: "com.apple.iohideventsystem.queue.tickle serviceID:10009be9e service:AppleUserHIDEventService product:CTRL Keyboard eventType:3"
        Timeout will fire in 600 secs Action=TimeoutActionRelease
   pid 80(powerd): [0x00044f2f00019216] 00:22:34 PreventUserIdleSystemSleep named: "Powerd - Prevent sleep while display is on"
```

See `man pmset` and `man caffeinate` for more details.

# See Overlaps For A Set Of Time Zones

The `tz` command (`brew install tz`) will display by default your local time
and UTC for comparison. By including the `TZ_LIST` env var with a semi-colon
separated list of time zones, you can display several time zones to see how
they compare. The results are even color coded for working, flex, and
non-working hours.

```bash
❯ TZ_LIST="US/Pacific;US/Central;Europe/Paris" tz

  What time is it?

  🕕 (CST) Local 6:59PM, Tue 05
   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23

  🕓 (PST) US/Pacific 4:59PM, Tue 05
  22  23   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21

  🕕 (CST) US/Central 6:59PM, Tue 05
   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23

  🕐 (CET) Europe/Paris 1:59AM, Wed 06
   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23   0   1   2   3   4   5   6
```

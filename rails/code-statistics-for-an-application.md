# Code Statistics For An Application

Rails applications and engines provide `stats`, a rake task for reporting
high level code statistics. Running it on a small project of mine generated
the following report:

```
$ rake stats
+----------------------+-------+-------+---------+---------+-----+-------+
| Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
+----------------------+-------+-------+---------+---------+-----+-------+
| Controllers          |   179 |   143 |       4 |      20 |   5 |     5 |
| Helpers              |    18 |    16 |       0 |       2 |   0 |     6 |
| Models               |    30 |    22 |       3 |       2 |   0 |     9 |
| Mailers              |     0 |     0 |       0 |       0 |   0 |     0 |
| Javascripts          |    53 |    35 |       0 |       6 |   0 |     3 |
| Libraries            |     0 |     0 |       0 |       0 |   0 |     0 |
| Controller specs     |    22 |    16 |       0 |       0 |   0 |     0 |
| Decorator specs      |    30 |    22 |       0 |       0 |   0 |     0 |
| Feature specs        |   739 |   382 |       0 |      74 |   0 |     3 |
| Model specs          |    70 |    55 |       0 |       0 |   0 |     0 |
| Cucumber features    |   412 |   293 |       0 |       0 |   0 |     0 |
+----------------------+-------+-------+---------+---------+-----+-------+
| Total                |  1553 |   984 |       7 |     104 |  14 |     7 |
+----------------------+-------+-------+---------+---------+-----+-------+
  Code LOC: 216     Test LOC: 768     Code to Test Ratio: 1:3.6
```

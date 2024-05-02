# Get A List Of Locales On Your System

The `locale -a` command will list all the available locales on your system.

You'll see a giant list that probably includes these and many more values.

```bash
$ locale -a

en_NZ
nl_NL.UTF-8
pt_BR.UTF-8
fr_CH.ISO8859-15
eu_ES.ISO8859-15
en_US.US-ASCII
af_ZA
bg_BG
cs_CZ.UTF-8
fi_FI
zh_CN.UTF-8
eu_ES
sk_SK.ISO8859-2
nl_BE
fr_BE
sk_SK
en_US.UTF-8
...
```

Each of these locales identifies itself by the language and the manner in which
the language is used in a particular place. For example, `en_NZ` is _English as
it is spoken in New Zealand_. `fr_BE` is _French as it is spoken in Belgium_.
`en_US.UTF-8` is _English as it is spoken in the US, with a UTF-8 character set
encoding_.

[source](https://www.postgresql.org/docs/current/locale.html#LOCALE-OVERVIEW)

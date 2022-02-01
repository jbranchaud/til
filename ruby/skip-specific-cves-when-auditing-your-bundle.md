# Skip Specific CVEs When Auditing Your Bundle

The [`bundler-audit` gem](https://github.com/rubysec/bundler-audit) is a tool
that can check for CVEs (Common Vulnerabilities and Exposures) in the installed
versions of gems in your Ruby project. This is a great addition to a CI
pipeline to ensure you aren't deploying code with vulnerabilities.

If you have a known CVE in one of your dependencies, I recommend installing a
patch as soon as possible. Of course, we have to apply some nuance to that
statement.

It is possible that we need to temporarily ignore the CVE warning to continue
to ship code while we work on integrating the patch. Or it may be super
low-risk and we are comfortable putting it off for a while.

Use the `--ignore` flag to prevent `bundler-audit` from flagging a specific
CVE.

```bash
$ bundler-audit check --ignore CVE-2022-23837
```

Or if you need to ignore multiple, list them one after another.

```bash
$ bundler-audit check --ignore CVE-2022-23837 CVE-2021-41817
```

If you do skip a CVE in your bundle audit, make sure you understand the risks
and have a plan for dealing with it in the future.

See `bundler-audit --help` or [their
docs](https://github.com/rubysec/bundler-audit) for more details.

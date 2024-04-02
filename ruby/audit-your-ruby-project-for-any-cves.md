# Audit Your Ruby Project For Any CVEs

The [`bundler-audit` gem](https://github.com/rubysec/bundler-audit) is a handy
tool that you can run manually or integrate into your CI workflow to warn you
about any CVEs in your dependencies.

Running this tool without any arguments will perform a check of your
`Gemfile.lock` file. It will check against the
[`ruby-advisory-db`](https://github.com/rubysec/ruby-advisory-db) for any CVEs
linked to your dependencies, down to the patch-level.

```bash
$ bundle exec bundler-audit

Name: puma
Version: 4.3.12
CVE: CVE-2024-21647
GHSA: GHSA-c2f4-cvqm-65w2
Criticality: Medium
URL: https://github.com/puma/puma/security/advisories/GHSA-c2f4-cvqm-65w2
Title: Puma HTTP Request/Response Smuggling vulnerability
Solution: upgrade to '~> 5.6.8', '>= 6.4.2'

Vulnerabilities found!
```

In this example run, a vulnerability was found in the currently installed
version of the `puma` gem.

I believe a standard `bundler-audit` command will make sure the advisory DB is
up-to-date, but to be sure, you can run the `update` command.

```bash
$ bundle exec bundler-audit update

Updating ruby-advisory-db ...
From https://github.com/rubysec/ruby-advisory-db
 * branch            master     -> FETCH_HEAD
Already up to date.
Updated ruby-advisory-db
ruby-advisory-db:
  advisories:   884 advisories
  last updated: 2024-03-26 16:27:16 -0700
  commit:       840f21aeeb8a06a93a3c3bf1e2a92d7167029992
```

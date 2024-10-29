# Get The SHA256 Hash For A File

Unix systems come with a `sha256sum` utility that we can use to compute the
SHA256 hash of a file. This means the contents of file are compressed into a
256-bit digest.

Here I use it on a SQL migration file that I've generated.

```bash
$ sha256sum migrations/0001_large_doctor_spectrum.sql
b75e61451e2ce37d831608b1bc9231bf3af09e0ab54bf169be117de9d4ff6805  migrations/0001_large_doctor_spectrum.sql
```

Each file passed to this utility gets output to a separate line which is why we
see the filename next to the hash. Since I am only running it on a single file
and I may want to pipe the output to some other program, I can clip off just
the part I need.

```bash
sha256sum migrations/0001_large_doctor_spectrum.sql | cut -d ' ' -f 1
b75e61451e2ce37d831608b1bc9231bf3af09e0ab54bf169be117de9d4ff6805
```

We can also produce these digests with `openssl`:

```bash
$ openssl dgst -sha256 migrations/0001_large_doctor_spectrum.sql
SHA2-256(migrations/0001_large_doctor_spectrum.sql)= b75e61451e2ce37d831608b1bc9231bf3af09e0ab54bf169be117de9d4ff6805

$ openssl dgst -sha256 migrations/0001_large_doctor_spectrum.sql | cut -d ' ' -f 2
b75e61451e2ce37d831608b1bc9231bf3af09e0ab54bf169be117de9d4ff6805
```

See `sha256sum --help` or `openssl dgst --help` for more details.

# Publish A Package To A Test Env As A Dry Run

As I was preparing to register a new Python package with PyPI and release my
first version cut, I felt like there were a lot of unknowns. Is my package's
name going to be valid? How will the package appear in PyPI? Did I configure
everything correctly? Etc.

It turns out that PyPI has a great way of answering a lot of these questions.
There is a [`test.pypi.org`](https://test.pypi.org/) site that parrots the
publishing flow of `pypi.org`. This makes for a great target to do a dry-run
publishing of a package.

First, I had to go through the same registration flow and 2FA setup as when I
registered with `pypi.org`.

Second, I deviated from my tag and CI-triggered publishing flow by instead doing
a one-off run of the `uv publish` command. That requires an API token which I
generated in the web UI for `test.pypi.org`. I added that to my env as
`TEST_PYPI_TOKEN`.

I then ran the following command:

```bash
❯ uv publish --publish-url https://test.pypi.org/legacy/ --token "$TEST_PYPI_TOKEN"
```

When this first ran for [`py-vmt`](https://github.com/jbranchaud/py-vmt), I got
an error back from the publishing API telling me the package name is too similar
to an existing package. I then had to make a few updates across the project to
rename the published package name to `visualmode-tracker`. Running the `uv
publish` command again worked with the updated name.

I was then able to go into the web UI and verify everything looked as expected.

I now have the confidence to publish this thing for real to `pypi.org`.

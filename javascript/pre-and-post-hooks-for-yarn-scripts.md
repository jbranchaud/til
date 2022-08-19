# Pre And Post Hooks For Yarn Scripts

In [yarn](https://classic.yarnpkg.com/) v1, there is a special syntax for
script names that allows you to define pre and post hooks.

For instance, if you have a `build` script, you can define a `prebuild` and/or
a `postbuild` script as well. Then, anytime you invoke `yarn build`, the
`prebuild` script will be automatically run before `build` and the `postbuild`
script be automatically run after `build`.

This `pre{script}` and `post{script}` syntax works for any script.

```json
{
  "scripts": {
    "predeploy": "node pre-deploy-steps"
    "deploy": "my-framework deploy",
    "postdeploy": "node post-deploy-steps"
  }
}
```

This syntax may lead to unexpected script invocations. For instance, a
`preserve` script will run ahead of a `serve` script even though those were
probably intended to be unrelated scripts. This is, in part, why this syntax is
no longer support in yarn v2.

[source](https://classic.yarnpkg.com/lang/en/docs/cli/run/#toc-yarn-run-script)

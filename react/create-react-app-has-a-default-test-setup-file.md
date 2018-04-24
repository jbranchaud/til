# create-react-app Has A Default Test Setup File

In [_Configure Jest To Run A Test Setup
File_](https://github.com/jbranchaud/til/blob/master/javascript/configure-jest-to-run-a-test-setup-file.md),
I pointed to a way of configuring Jest in either the `package.json` or
`jest.config.js` file with the `setupTestFrameworkScriptFile` value.

In a `create-react-app` project, this is not an option because
`setupTestFrameworkScriptFile` is not one of the permitted config values for
Jest.

There is a built-in value which happens to match what was recommended in the
above post -- `<rootDir>src/setupTests.js`.

This means that there is no configuration required. Instead, just create a
`setupTests.js` file in the `src` directory of your CRA project and add any
framework setup you need there. That file is already configured to run when
you invoke `yarn test`.

[source](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#initializing-test-environment)

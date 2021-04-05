# npm-monorepo-issue

Repo for demonstrating the behavior seen in https://github.com/npm/cli/issues/3028

---

## How to run this repro

1. Install npm 6 and run the test (works)

```console
➜  npm-monorepo-issue git:(main) ✗ npm i npm@6 -g

removed 58 packages, changed 11 packages, and audited 436 packages in 3s

3 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
➜  npm-monorepo-issue git:(main) ✗ ./run.sh 
Running repro using npm version 6.14.12
npm WARN app1@ No description
npm WARN app1@ No repository field.
npm WARN app1@ No license field.

added 2 packages from 2 contributors and audited 2 packages in 0.671s
found 0 vulnerabilities


> app1@ start /home/frederik/projects/npm-monorepo-issue/app1
> ./cmd.js

hello npm!
```

2. Install npm 7 and run the test (fails)

```console
➜  npm-monorepo-issue git:(main) ✗ npm i npm@7 -g
/home/frederik/.nvm/versions/node/v10.15.3/bin/npm -> /home/frederik/.nvm/versions/node/v10.15.3/lib/node_modules/npm/bin/npm-cli.js
/home/frederik/.nvm/versions/node/v10.15.3/bin/npx -> /home/frederik/.nvm/versions/node/v10.15.3/lib/node_modules/npm/bin/npx-cli.js
+ npm@7.8.0
added 58 packages from 23 contributors, removed 241 packages and updated 194 packages in 4.334s
➜  npm-monorepo-issue git:(main) ✗ ./run.sh 
Running repro using npm version 7.8.0

added 1 package, and audited 3 packages in 745ms

found 0 vulnerabilities

> start
> ./cmd.js

internal/modules/cjs/loader.js:584
    throw err;
    ^

Error: Cannot find module 'lodash'
    at Function.Module._resolveFilename (internal/modules/cjs/loader.js:582:15)
    at Function.Module._load (internal/modules/cjs/loader.js:508:25)
    at Module.require (internal/modules/cjs/loader.js:637:17)
    at require (internal/modules/cjs/helpers.js:22:18)
    at Object.<anonymous> (/home/frederik/projects/npm-monorepo-issue/packages/pkg1/index.js:1:73)
    at Module._compile (internal/modules/cjs/loader.js:701:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:712:10)
    at Module.load (internal/modules/cjs/loader.js:600:32)
    at tryModuleLoad (internal/modules/cjs/loader.js:539:12)
    at Function.Module._load (internal/modules/cjs/loader.js:531:3)
```

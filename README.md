# `Swagger sample` Written by [Jsonnet](https://jsonnet.org/) and TypeScript

* [Swagger UI](http://haruwo.github.io/swagger-jsonnet-ts/)
* [![CircleCI](https://circleci.com/gh/haruwo/swagger-jsonnet-ts.svg?style=svg)](https://circleci.com/gh/haruwo/swagger-jsonnet-ts)

### build

If merge to branch `master`, automatical update docs/ by CircleCI.

### Execution on your machine.

```bash
./run.bash
```

1. http://127.0.0.1:8080/ --> SwaggerUI
2. http://127.0.0.1:4010/ --> Mock by [prism](https://stoplight.io/open-source/prism/)

### Structure

| path                        | description                                                                                                              |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------|
| src/openapi.jsonnet         | root file of opeapi.json as [Jsonnet](https://jsonnet.org/)                                                              |
| src/definitions.ts          | root file of json-schema as TypeScript with [typescript-json-schema](https://github.com/YousefED/typescript-json-schema) |
| cypress/integration/**/*.ts | [cypress](https://www.cypress.io/) spec files.                                                                           |


local _ = import 'lib.libsonnet';

{
  openapi: '3.0.0',

  info: {
    title: 'Samplecode of Swagger',
    description: |||
      Samplecode of Swagger by Jsonnet and TypeScript.
    |||,
    version: '0.0.1',
    contact: {
      name: 'https://github.com/haruwo',
    },
  },

  servers: [
    { url: 'https://api.example.local/v1' },
    { url: 'http://127.0.0.1:4010' },
  ],

  components: {
    securitySchemes: {
      bearerAuth: {
        type: 'http',
        scheme: 'bearer',
        bearerFormat: 'JWT',
      },
    },

    schemas: import '../../build/schemas.json',
  },

  paths: import 'paths.libsonnet',

  tags: _.extractTags(self.paths),
}

local auth = import 'paths/auth.libsonnet';

local account = import 'paths/account.libsonnet';

local paths = {
  '/': {
    get: {
      operationId: 'root',
      description: 'Root content',
      tags: ['health'],
      responses: {
        '204': {
          description: 'No Content',
        },
      },
    },
  },
  '/health': import 'paths/health.libsonnet',
  '/accounts/me': account.me,
  '/accounts/me/signout': account.signout,
  '/auth/signin': auth.signin,
  '/auth/signup': auth.signup,
  '/auth/token': auth.token,
};

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
    { url: 'https://api.fqdn/v1' },
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

    schemas: import '../build/schemas.json',
  },

  tags: [
    { name: 'auth' },
    { name: 'account' },
    { name: 'health' },
  ],

  paths: paths,
}

local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/signin': {
    post: {
      operationId: 'auth.signin',
      tags: ['auth'],
      description: 'Sign-in as exists account.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/SigninRequest' } } },
      },
      responses: responses.commons {
        '201': {
          description: 'Sing-in was succeeded.',
          headers: headers.commons {
            Location: {
              schema: { type: 'string' },
              description: "Always '/account'",
            },
          },
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Token' } } },
        },
      },
    },
  },

  '/signup': {
    post: {
      operationId: 'auth.signup',
      tags: ['auth'],
      description: 'Register new account.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/SignupRequest' } } },
      },
      responses: responses.commons {
        '201': {
          description: 'Registered new account',
          headers: headers.commons {
            Location: {
              schema: { type: 'string' },
              description: "Always '/account'",
            },
          },
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Token' } } },
        },
      },
    },
  },

  '/token': {
    post: {
      operationId: 'auth.token',
      tags: ['auth'],
      description: 'Refresh tokens.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/RefreshTokenRequest' } } },
      },
      responses: responses.commons {
        '201': {
          description: 'Refresh tokens was succeeded.',
          headers: headers.commons {
            Location: {
              schema: { type: 'string' },
              description: "Always '/account'",
            },
          },
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Token' } } },
        },
      },
    },
  },
}

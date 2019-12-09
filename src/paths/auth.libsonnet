local commonHeaders = import 'common_headers.libsonnet';

local commonResponses = import 'common_responses.libsonnet';

{
  signin: {
    post: {
      operationId: 'auth.signin',
      tags: ['auth'],
      description: 'Sign-in as exists account.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/SigninRequest' } } },
      },
      responses: commonResponses {
        '201': {
          description: 'Sing-in was succeeded.',
          headers: commonHeaders {
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

  signup: {
    post: {
      operationId: 'auth.signup',
      tags: ['auth'],
      description: 'Register new account.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/SignupRequest' } } },
      },
      responses: commonResponses {
        '201': {
          description: 'Registered new account',
          headers: commonHeaders {
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

  token: {
    post: {
      operationId: 'auth.token',
      tags: ['auth'],
      description: 'Refresh tokens.',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/RefreshTokenRequest' } } },
      },
      responses: commonResponses {
        '201': {
          description: 'Refresh tokens was succeeded.',
          headers: commonHeaders {
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

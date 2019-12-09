local commonHeaders = import 'common_headers.libsonnet';

local commonResponses = import 'common_responses.libsonnet';

{
  me: {
    get: {
      operationId: 'account.get',
      security: [{ bearerAuth: [] }],
      tags: ['account'],
      description: 'Get account info',
      responses: commonResponses {
        '200': {
          description: 'Account info',
          headers: commonHeaders,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Account' } } },
        },
      },
    },

    put: {
      operationId: 'account.put',
      security: [{ bearerAuth: [] }],
      tags: ['account'],
      description: 'put account info',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/UpdateAccount' } } },
      },
      responses: commonResponses {
        '200': {
          description: 'Account info',
          headers: commonHeaders,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Account' } } },
        },
      },
    },
  },

  signout: {
    post: {
      operationId: 'account.signout',
      security: [{ bearerAuth: [] }],
      tags: ['account', 'auth'],
      description: 'Sign-out all sessions',
      responses: commonResponses {
        '204': {
          description: 'No Content',
          headers: commonHeaders,
        },
      },
    },
  },
}

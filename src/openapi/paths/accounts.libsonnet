local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/me': {
    get: {
      operationId: 'account.get',
      security: [{ bearerAuth: [] }],
      tags: ['account'],
      description: 'Get account info',
      responses: responses.commons {
        '200': {
          description: 'Account info',
          headers: headers.commons,
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
      responses: responses.commons {
        '200': {
          description: 'Account info',
          headers: headers.commons,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Account' } } },
        },
      },
    },
  },

  '/me/signout': {
    post: {
      operationId: 'account.signout',
      security: [{ bearerAuth: [] }],
      tags: ['account', 'auth'],
      description: 'Sign-out all sessions',
      responses: responses.commons {
        '204': {
          description: 'No Content',
          headers: headers.commons,
        },
      },
    },
  },
}

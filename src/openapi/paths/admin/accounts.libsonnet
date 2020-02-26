local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    get: {
      operationId: 'admin.account.list',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'account'],
      description: 'Search accounts',
      parameters: [
        {
          'in': 'query',
          name: 'q',
          schema: {
            type: 'string',
          },
          description: 'Query string',
          required: false,
        },
      ],
      responses: responses.commons {
        '200': {
          description: 'Found accounts',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Accounts',
              },
            },
          },
        },
      },
    },

    post: {
      operationId: 'admin.account.post',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'account'],
      description: 'Create account',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/CreateAccount' } } },
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

  '/{id}': {
    local idPathParameters = [
      {
        'in': 'path',
        name: 'id',
        schema: { type: 'string' },
        description: 'id of item',
        required: true,
      },
    ],

    get: {
      operationId: 'admin.account.get',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'account'],
      description: 'Get account info',
      parameters: idPathParameters,
      responses: responses.commons {
        '200': {
          description: 'Account info',
          headers: headers.commons,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Account' } } },
        },
      },
    },

    put: {
      operationId: 'admin.account.put',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'account'],
      description: 'Update account',
      parameters: idPathParameters,
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

    delete: {
      operationId: 'admin.account.delete',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'account'],
      description: 'Delete account info',
      parameters: idPathParameters,
      responses: responses.commons {
        '204': {
          description: 'No content',
          headers: headers.commons,
        },
      },
    },
  },
}

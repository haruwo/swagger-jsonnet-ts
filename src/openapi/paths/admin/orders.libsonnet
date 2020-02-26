local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    get: {
      operationId: 'admin.order.list',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'order'],
      description: 'Search orders',
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
          description: 'Found orders',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Orders',
              },
            },
          },
        },
      },
    },
  },

  local idPathParameters = [
    {
      'in': 'path',
      name: 'id',
      schema: { type: 'string' },
      description: 'ID of order',
      required: true,
    },
  ],

  '/{id}': {
    get: {
      operationId: 'admin.order.get',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'order'],
      description: 'Get order',
      parameters: idPathParameters,
      responses: responses.commons {
        '200': {
          description: 'Found order',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Order',
              },
            },
          },
        },
      },
    },
  },

  '/{id}/_cancel': {
    post: {
      operationId: 'admin.order.cancel',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'order'],
      description: 'Cancel order',
      parameters: idPathParameters,
      responses: responses.commons {
        '200': {
          description: 'Canceled order',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Order',
              },
            },
          },
        },
      },
    },
  },

  '/{id}/_commit': {
    post: {
      operationId: 'admin.order.commit',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'order'],
      description: 'Commit order',
      parameters: idPathParameters,
      responses: responses.commons {
        '200': {
          description: 'Committed order',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Order',
              },
            },
          },
        },
      },
    },
  },
}

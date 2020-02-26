local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    get: {
      operationId: 'order.list',
      security: [{ bearerAuth: [] }],
      tags: ['order'],
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

    post: {
      operationId: 'order.create',
      security: [{ bearerAuth: [] }],
      tags: ['order'],
      description: 'Create order',
      requestBody: {
        required: true,
        content: {
          'application/json': {
            schema: {
              '$ref': '#/components/schemas/CreateOrder',
            },
          },
        },
      },
      responses: responses.commons {
        '201': {
          description: 'Created order',
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
      operationId: 'order.get',
      security: [{ bearerAuth: [] }],
      tags: ['order'],
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
      operationId: 'order.cancel',
      security: [{ bearerAuth: [] }],
      tags: ['order'],
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
}

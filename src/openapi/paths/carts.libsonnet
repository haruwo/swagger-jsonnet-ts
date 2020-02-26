local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/current': {
    get: {
      operationId: 'cart.get',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Get current cart',
      responses: responses.commons {
        '200': {
          description: 'Cart info',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Cart',
              },
            },
          },
        },
      },
    },

    put: {
      operationId: 'cart.put',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Update current cart',
      requestBody: {
        required: true,
        content: {
          'application/json': {
            schema: {
              '$ref': '#/components/schemas/UpdateCart',
            },
          },
        },
      },
      responses: responses.commons {
        '200': {
          description: 'Cart info',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Cart',
              },
            },
          },
        },
      },
    },
  },

  '/{id}/items': {
    local pathParameters = [
      {
        'in': 'path',
        name: 'id',
        schema: { type: 'string' },
        description: 'ID of cart',
        required: true,
      },
    ],

    get: {
      operationId: 'cart.item.list',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Search items in cart',
      parameters: pathParameters + [
        {
          'in': 'query',
          name: 'q',
          schema: { type: 'string' },
          description: 'Query string',
          required: false,
        },
      ],
      responses: responses.commons {
        '200': {
          description: 'Found items',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/CartItems',
              },
            },
          },
        },
      },
    },

    post: {
      operationId: 'cart.item.post',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Create item into cart',
      parameters: pathParameters,
      requestBody: {
        required: true,
        content: {
          'application/json': {
            schema: {
              '$ref': '#/components/schemas/CreateCartItem',
            },
          },
        },
      },
      responses: responses.commons {
        '201': {
          description: 'Created item',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/CartItem',
              },
            },
          },
        },
      },
    },

    delete: {
      operationId: 'cart.item.deleteAll',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Delete all items in cart',
      parameters: pathParameters,
      responses: responses.commons {
        '204': {
          description: 'No content',
          headers: headers.commons,
        },
      },
    },
  },

  '/{id}/items/{itemID}': {
    local pathParameters = [
      {
        'in': 'path',
        name: 'id',
        schema: { type: 'string' },
        description: 'ID of cart',
        required: true,
      },
      {
        'in': 'path',
        name: 'itemID',
        schema: { type: 'string' },
        description: 'ID of item',
        required: true,
      },
    ],

    get: {
      operationId: 'cart.item.get',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Get item in cart',
      parameters: pathParameters,
      responses: responses.commons {
        '200': {
          description: 'Found item',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/CartItem',
              },
            },
          },
        },
      },
    },

    put: {
      operationId: 'cart.item.put',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Update item in cart',
      parameters: pathParameters,
      requestBody: {
        required: true,
        content: {
          'application/json': {
            schema: {
              '$ref': '#/components/schemas/UpdateCartItem',
            },
          },
        },
      },
      responses: responses.commons {
        '200': {
          description: 'Updated item',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/CartItem',
              },
            },
          },
        },
      },
    },

    delete: {
      operationId: 'cart.item.delete',
      security: [{ bearerAuth: [] }],
      tags: ['cart'],
      description: 'Delete item in cart',
      parameters: pathParameters,
      responses: responses.commons {
        '204': {
          description: 'No content',
          headers: headers.commons,
        },
      },
    },
  },
}

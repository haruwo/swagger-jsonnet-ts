local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    get: {
      operationId: 'admin.item.list',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'item'],
      description: 'Search items',
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
          description: 'Found items',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Items',
              },
            },
          },
        },
      },
    },

    post: {
      operationId: 'admin.item.post',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'item'],
      description: 'Create item',
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/CreateItem' } } },
      },
      responses: responses.commons {
        '200': {
          description: 'Item info',
          headers: headers.commons,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Item' } } },
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
      operationId: 'admin.item.get',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'item'],
      description: 'Get item info',
      parameters: idPathParameters,
      responses: responses.commons {
        '200': {
          description: 'Item info',
          headers: headers.commons,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Item' } } },
        },
      },
    },

    put: {
      operationId: 'admin.item.put',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'item'],
      description: 'Update item',
      parameters: idPathParameters,
      requestBody: {
        required: true,
        content: { 'application/json': { schema: { '$ref': '#/components/schemas/UpdateItem' } } },
      },
      responses: responses.commons {
        '200': {
          description: 'Item info',
          headers: headers.commons,
          content: { 'application/json': { schema: { '$ref': '#/components/schemas/Item' } } },
        },
      },
    },

    delete: {
      operationId: 'admin.item.delete',
      security: [{ bearerAuth: [] }],
      tags: ['admin', 'item'],
      description: 'Delete item info',
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

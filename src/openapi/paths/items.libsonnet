local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    get: {
      operationId: 'item.list',
      tags: ['item'],
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
  },

  '/{id}': {
    get: {
      operationId: 'item.get',
      tags: ['item'],
      description: 'Get item',
      parameters: [
        {
          'in': 'path',
          name: 'id',
          schema: {
            type: 'string',
          },
          description: 'id of item',
          required: true,
        },
      ],
      responses: responses.commons {
        '200': {
          description: 'Found item',
          headers: headers.commons,
          content: {
            'application/json': {
              schema: {
                '$ref': '#/components/schemas/Item',
              },
            },
          },
        },
      },
    },
  },
}

local headers = import 'headers.libsonnet';

local responses = import 'responses.libsonnet';

{
  '/': {
    head: {
      operationId: 'health.head',
      tags: ['health'],
      description: 'Response server health info',
      responses: responses.commons {
        '200': {
          description: 'Status info',
          headers: headers.commons,
        },
      },
    },
    get: {
      operationId: 'health.get',
      tags: ['health'],
      description: 'Response server health info',
      responses: responses.commons {
        '200': {
          description: 'Status info',
          headers: headers.commons,
          content: {
            'text/plain': {
              schema: {
                type: 'string',
                example: 'OK',
              },
            },
          },
        },
      },
    },
  },
}

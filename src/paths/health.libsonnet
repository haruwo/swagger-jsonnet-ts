local commonHeaders = import 'common_headers.libsonnet';

local commonResponses = import 'common_responses.libsonnet';

{
  head: {
    operationId: 'health.head',
    tags: ['health'],
    description: 'Response server health info',
    responses: commonResponses {
      '200': {
        description: 'Status info',
        headers: commonHeaders,
      },
    },
  },
  get: {
    operationId: 'health.get',
    tags: ['health'],
    description: 'Response server health info',
    responses: commonResponses {
      '200': {
        description: 'Status info',
        headers: commonHeaders,
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
}

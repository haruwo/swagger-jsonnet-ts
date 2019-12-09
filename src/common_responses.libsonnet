local commonHeaders = import 'common_headers.libsonnet';

{
  '400': {
    description: 'On validation error.',
    headers: commonHeaders,
    content: {
      'application/json': {
        schema: {
          '$ref': '#/components/schemas/ValidationError',
        },
      },
    },
  },

  '401': {
    description: 'Unauthorized',
    headers: commonHeaders,
    content: {
      'application/json': {
        schema: {
          type: 'string',
          example: 'Unauthorized'
        },
      },
    },
  },

  '500': {
    description: 'On internal server error.',
    headers: commonHeaders,
    content: {
      'application/json': {
        schema: {
          '$ref': '#/components/schemas/InternalServerError',
        },
      },
    },
  },
}

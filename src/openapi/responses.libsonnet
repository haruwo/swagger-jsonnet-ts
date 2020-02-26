local headers = import 'headers.libsonnet';

{
  commons:: {
    '400': {
      description: 'On validation error.',
      headers: headers.commons,
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
      headers: headers.commons,
      content: {
        'application/json': {
          schema: {
            type: 'string',
            example: 'Unauthorized',
          },
        },
      },
    },

    '500': {
      description: 'On internal server error.',
      headers: headers.commons,
      content: {
        'application/json': {
          schema: {
            '$ref': '#/components/schemas/InternalServerError',
          },
        },
      },
    },
  },
}

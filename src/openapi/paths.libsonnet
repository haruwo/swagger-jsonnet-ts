local _ = import 'lib.libsonnet';

_.mount('/accounts', import './paths/accounts.libsonnet') +
_.mount('/auth', import './paths/auth.libsonnet') +
_.mount('/health', import './paths/health.libsonnet') +

{
  '/': {
    get: _.noContent { operationId: 'root', description: 'Root content', tags: ['health'] },
  },
}

const wp = require('@cypress/webpack-preprocessor')
const {SwaggerValidation} = require('@jc21/cypress-swagger-validation')

module.exports = (on, config) => {
  on('file:preprocessor', wp({
    webpackOptions: require('../webpack.config'),
  }))

  on('task', SwaggerValidation(config))

  return config
}

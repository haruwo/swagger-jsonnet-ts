const wp = require('@cypress/webpack-preprocessor')
const {SwaggerValidation} = require('@jc21/cypress-swagger-validation')

module.exports = (on, config) => {
  on('file:preprocessor', wp({
    webpackOptions: require('../webpack.config'),
  }))

  on('task', SwaggerValidation(config))

  on('task', {
    log (message) {
      if (typeof message === 'object') {
        console.dir(message, { depth: null })
      } else {
        console.log(message);
      }

      return null
    }
  })

  return config
}

const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

module.exports = environment

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)

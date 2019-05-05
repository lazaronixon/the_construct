const { environment } = require('@rails/webpacker')

module.exports = environment

// Add an additional plugin of your choosing : ProvidePlugin
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery'
}))

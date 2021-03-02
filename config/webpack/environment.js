const {
  environment
} = require('@rails/webpacker')


const webpack = require('@rails/webpacker')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jquery: 'jquery',
  popper: ['popper.js', 'default']
}))
module.exports = environment
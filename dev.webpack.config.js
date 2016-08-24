
var config = require('./webpack.config.js');

config.entry = {
  test: './test/test'
}
config.devServer = {
  contentBase: './test'
}

module.exports = config;


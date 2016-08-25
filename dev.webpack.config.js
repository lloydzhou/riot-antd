
var config = require('./webpack.config.js');

config.devtool = 'source-map';
config.entry = {
  test: './test/test',
  vendor: ['riot'],
}
config.devServer = {
  contentBase: './test',
  inline: true,
  hot: true,
}

module.exports = config;


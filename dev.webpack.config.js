
var config = require('./webpack.config.js');
var DashboardPlugin = require('webpack-dashboard/plugin');

config.devtool = 'source-map';
config.entry = {
  test: './test/test',
  vendor: ['riot'],
}
config.plugins.push(new DashboardPlugin());
config.devServer = {
  contentBase: './test',
  //inline: true,
  //hot: true,
}

module.exports = config;


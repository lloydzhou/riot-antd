var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: './components/index',
  output: {
    path: __dirname + '/dist',
    filename: 'antd.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }),
    new ExtractTextPlugin('antd.css'),
    new webpack.optimize.DedupePlugin()
  ],
  module: {
    preLoaders: [{
      test: /\.tag$/,
      exclude: /node_modules/,
      loader: 'riotjs-loader',
      query: {
        type: 'none'
      }
    }],
    loaders: [{
      test: /\.js$|\.tag$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
      //query: {
      //  presets: ['es2015']
      //}
    },{
      test: /\.less$/,
      loader: ExtractTextPlugin.extract('style', '!css!less'),
      //loader: 'style!css!less'
    }]
  },
  devServer: {
    contentBase: './test'
  }
};


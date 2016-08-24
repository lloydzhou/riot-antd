var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: {
    antd: './index',
    test: './test/test',
  },
  output: {
    path: __dirname + '/dist',
    filename: '[name].js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }),
    new ExtractTextPlugin('antd.css', {allChunks: true}),
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
      query: {
        presets: ['es2015']
      }
    },{
      test: /\.less$/,
      //loader: ExtractTextPlugin.extract('style-loader', 'css-loader!less-loader'),
      loader: ExtractTextPlugin.extract('style', '!css!less'),
      //loader: 'style!css!less'
    }]
  },
  devServer: {
    contentBase: './test'
  }
};


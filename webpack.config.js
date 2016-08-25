var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var OptimizeCssAssetsPlugin = require("optimize-css-assets-webpack-plugin");
var VendorChunkPlugin = require('webpack-vendor-chunk-plugin');
var VendorPlugin = require('webpack-vendor-plugin')


module.exports = {
  entry: {
    antd: './index',
    'antd.min': './index',
  },
  output: {
    path: __dirname + '/dist',
    filename: '[name].js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }),
    new ExtractTextPlugin('[name].css', {allChunks: true}),
    new VendorPlugin({dir: 'node_modules'}),
    new webpack.optimize.UglifyJsPlugin({
      include: /\.min\.js$/,
      minimize: true
    }),
    new OptimizeCssAssetsPlugin({
      assetNameRegExp: /\.min\.css$/,
      cssProcessorOptions: { discardComments: { removeAll: true } }
   })
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
};


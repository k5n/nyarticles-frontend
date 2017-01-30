const path = require('path');

module.exports = {
  entry: {
    app: [ './src/app.js' ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js'
  },

  module: {
    loaders: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]'
      },
      {
        test: /\.css$/,
        exclude: /node_modules/,
        loaders: [ 'style-loader', 'css-loader' ]
      },
      {
        test: /\.scss$/,
        exclude: /node_modules/,
        loaders: [ 'style-loader', 'css-loader', 'sass-loader' ]
      },
      {
        test: /\.elm$/,
        exclude: [ /eml-stuff/, /node_modules/ ],
        loader: 'elm-webpack?verbose=true&warn=true'
      }
    ],

    noParse: /\.elm$/
  }
};

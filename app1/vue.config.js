// Temporary until we can use https://github.com/webpack/webpack-dev-server/pull/2143
const { isLocal } = require('./utils');

module.exports = {
  chainWebpack: config => {
    config.entry(isLocal() ? './src/main.js' : './src/main-single-spa.js');
    config.devServer.set('inline', false);
    config.devServer.set('hot', true);
    config.externals(isLocal() ? [] : ['vue', 'vue-router']);
  },
  filenameHashing: false,
}

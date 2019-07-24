// Temporary until we can use https://github.com/webpack/webpack-dev-server/pull/2143
module.exports = {
  chainWebpack: config => {
    config.devServer.set('inline', false)
    config.devServer.set('hot', false)
  }
}
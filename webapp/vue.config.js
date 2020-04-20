module.exports = {
  "transpileDependencies": [
    "vuetify"
  ],
  devServer: {
    port:"8081",
    proxy:{
      "/": {
        target: 'https://dgsdocinfo.appspot.com'
      }
    }

  }
};
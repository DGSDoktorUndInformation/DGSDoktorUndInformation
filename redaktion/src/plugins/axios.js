"use strict";

import Vue from 'vue';
import axios from "axios";
import router from "../router";

// Full config:  https://github.com/axios/axios#request-config
// axios.defaults.baseURL = process.env.baseURL || process.env.apiUrl || '';
axios.defaults.baseURL = process.env.VUE_APP_COUCHDB_URL
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

let config = {
  // baseURL: process.env.baseURL || process.env.apiUrl || ""
  // timeout: 60 * 1000, // Timeout
  withCredentials: true, // Check cross-site Access-Control
};

const _axios = axios.create(config);

_axios.interceptors.request.use(
    function(config) {
        // Do something before request is sent
      return config;
    },
    function(error) {
      // Do something with request error
      return Promise.reject(error);
    }
);

// Add a response interceptor
_axios.interceptors.response.use(
    function(response) {
      // Do something with response data
      return response;
    },
    async function(error) {
      // Do something with response error
        if(error.response.status === 401 && error.response.data.reason === "You are not authorized to access this db.") {
            await router.push({name: "Login", params: {message:"Login abgelaufen, Formular konnte nicht gespeichert werden"}})
        }
        if(error.response.status === 401 && error.response.data.reason === "Name or password is incorrect.") {
            return error.response;
        }
      return Promise.reject(error);
    }
);

Plugin.install = function(Vue) {
  Vue.axios = _axios;
  window.axios = _axios;
  Object.defineProperties(Vue.prototype, {
    axios: {
      get() {
        return _axios;
      }
    },
    $axios: {
      get() {
        return _axios;
      }
    },
  });
};

Vue.use(Plugin)

export default Plugin;